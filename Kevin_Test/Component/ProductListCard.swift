//
//  ProductListCard.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct ProductListCard: View {
    var data: ProductData
    var rate: Double {
        return data.rating?.rate ?? 0.0
    }
    var body: some View {
        CardView(strokeColor: .SecondaryTextColor, backgroundColor: .PrimaryBackground) {
            HStack(alignment: .lastTextBaseline, spacing: 16) {
                WebImage(url: URL(string: data.image ?? ""))
                    .resizable()
                    .frame(width: 108, height: 130, alignment: .center)
                productContent
            }.frame(maxWidth: .infinity)
        }.cornerRadius(8.0)
    }

    private var productContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                Text(data.title ?? "")
                    .Poppins(.semiBold, size: 13)
                starRating(rating: .constant(Int(rate)), label: "\(rate) (\(data.rating?.count ?? 0))")
            }

            if let price = data.price {
                Text("$\(String(price))")
                    .Poppins(.semiBold, size: 18)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

