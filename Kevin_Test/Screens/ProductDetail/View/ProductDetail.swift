//
//  ProductDetail.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct ProductDetail: View {
    var data: ProductData
    @Binding var visibility: Visibility
    var body: some View {
        VStack {
            CustomNavigationView()
            ScrollView {
                VStack(spacing: 25) {
                    WebImage(url: URL(string: data.image ?? ""))
                        .resizable()
                        .frame(width: 251, height: 321, alignment: .center)

                    VStack(alignment: .leading) {
                        ProductDetailsheet(data: data)
                    }
                    .background(Color.PrimaryBackground)
                    .customCornerRadius(45, corners: [.topRight, .topLeft])
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.SecondaryBackground)

            DetailFooter(data: data)
        }.onAppear { self.visibility = .hidden }
        .onDisappear { self.visibility = .visible}
        .navigationBarHidden(true)
        .toolbar(visibility, for: .tabBar)
    }
}

fileprivate struct ProductDetailsheet: View {
    var data: ProductData
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Group {
                DetailHeader(data: data).padding(.top, 25)

                Text(data.description ?? "")
                    .Poppins(.regular, size: 12)
                    .foregroundColor(.SecondaryTextColor)
            }.padding(.horizontal, 20)
            Spacer()
        }.frame(maxWidth: .infinity)
            .background(Color.PrimaryBackground)
    }
}

fileprivate struct DetailHeader: View {
    var data: ProductData
    var rate: Double {
        return data.rating?.rate ?? 0.0
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(data.category ?? "")
                .Poppins(.regular, size: 12)
                .foregroundColor(.SecondaryTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(data.title ?? "")
                .Poppins(.semiBold, size: 20)
                .frame(maxWidth: .infinity, alignment: .leading)

            starRating(rating: .constant(Int(rate)), label: "\(rate) (\(data.rating?.count ?? 0))")
        }
    }
}

fileprivate struct DetailFooter: View {
    var data: ProductData
    var body: some View {
        HStack {
            if let price = data.price {
                Text("$\(String(price))")
                    .Poppins(.semiBold, size: 19)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 23)
            }
            Button(action: {}, label: {
                Text("Add to Cart")
                    .foregroundColor(.white)
                    .Poppins(.regular, size: 16)
                    .padding(16)
                    .background(Color.PrimaryColor)
                    .cornerRadius(10)
            })
            .padding(.trailing, 20)
            .padding(.top, 16)

        }.frame(maxWidth: .infinity)
            .background(Color.PrimaryBackground)
    }
}

private struct CustomNavigationView: View {
    @Environment(\.dismiss) private var dismiss
    @State var isTapped = false
    var body: some View {
        HStack {
            Button(action: { dismiss() }, label: {
                Image("Arrow").resizable()
                    .frame(width: 24, height: 24, alignment: .leading)
            }).padding(.leading, 16)
            Spacer()
            Button(action: {
                self.isTapped.toggle()
            }, label: {
                if isTapped {
                    LottieView(filename: "like", isPaused: false)
                        .frame(width: 24, height: 24)
                } else {
                    Image("Favorites")
                        .frame(width: 24, height: 24)
                }

            }).padding(.trailing, 20)
        }
    }
}
