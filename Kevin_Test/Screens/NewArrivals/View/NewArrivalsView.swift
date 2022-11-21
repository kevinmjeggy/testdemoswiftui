//
//  NewArrivalsView.swift
//  Kevin_Test
//
//  Created by Kevin on 19/11/22.
//

import Foundation
import SwiftUI

struct NewArrivalsView: View {
    @StateObject var viewModel = NAViewModel()
    @State var visibility: Visibility = .visible
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HeaderView()
                    SearchControl(searchText: $viewModel.searchText) {
                        viewModel.searchForProduct()
                    }
                    .onChange(of: viewModel.searchText, perform: { newVal in
                        if newVal.isEmpty {
                            viewModel.searchForProduct()
                        }
                    })

                    ForEach(viewModel.shoppingList, id: \.self) { data in
                        NavigationLink(destination: { ProductDetail(data: data, visibility: $visibility) },
                                       label: { ProductListCard(data: data) })
                            .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }.padding(.horizontal, 20)

            }.background(Color.SecondaryBackground)
                .navigationBarHidden(true)
                .toolbar(visibility, for: .tabBar)
                .onAppear() {
                    self.visibility = .visible
                }
        }
    }
}

struct NewArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        NewArrivalsView()
    }
}

fileprivate struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button(action: { }, label: {
                Image("HandBurger").resizable()
                    .frame(width: 28, height: 16, alignment: .center)
            })

            VStack(alignment: .leading, spacing: 8) {
                Group {
                    Text("New Arrivals")
                        .Poppins(.semiBold, size: 32)
                        .foregroundColor(.PrimaryText)

                    Text("Custom clothing for the modern unique man")
                        .Poppins(.regular, size: 14)
                        .foregroundColor(.SecondaryTextColor)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
