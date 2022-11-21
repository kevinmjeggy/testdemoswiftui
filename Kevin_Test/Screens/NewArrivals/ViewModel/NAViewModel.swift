//
//  NAViewModel.swift
//  Kevin_Test
//
//  Created by Kevin on 19/11/22.
//

import Foundation
import SwiftyJSON

@MainActor
class NAViewModel: ObservableObject {
    var productArray = [ProductData]()
    @Published var shoppingList = [ProductData]()
    @Published var searchText: String = ""
    @Published var showDetail = false

    init() {
        Task {
            await fetchData()
        }
    }

    func fetchData() async {
        guard let apiUrl = URL(string: "https://fakestoreapi.com/products") else { return }
        shoppingList.removeAll()
        productArray.removeAll()
        do {
            let (data, _) = try await URLSession.shared.data(from: apiUrl)
            let responseData = try JSON(data: data)
            responseData.forEach({ jsonData in
                do {
                    let rawData = try jsonData.1.rawData()
                    if let decodedResponse = try? JSONDecoder().decode(ProductData.self, from: rawData) {
                        shoppingList.append(decodedResponse)
                        self.productArray.append(decodedResponse)
                    }
                } catch {
                    print("Error \(error)")
                }
            })
        } catch {
            print("error")
        }
    }

    func searchForProduct() {
        if searchText.isEmpty {
            shoppingList = productArray
        } else {
            shoppingList = productArray.filter({ data in
                guard let val = data.title else { return false }
                return val.contains(searchText)
            })
        }
    }
}
