//
//  SearchControl.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import SwiftUI

struct SearchControl: View {
    @State var strokeColor: Color = .SecondaryTextColor
    @Binding var searchText: String
    var onSearch: () -> ()
    var body: some View {
        CardView(strokeColor: strokeColor, paddingVal: 6) {
            HStack {
                TextField("Search items...", text: $searchText)
                    .onChange(of: searchText) { _ in
                    }
                    .onTapGesture {
                        self.strokeColor = .PrimaryText
                    }
                    .onSubmit {
                        self.strokeColor = .SecondaryTextColor
                    }
                    .padding(.leading, 10)
                Spacer()
                Button(action:  { onSearch() }, label: {
                    Image("Search").resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .padding(16)
                }).background(Color.PrimaryColor)
                    .cornerRadius(8.0)
                    .padding(.trailing, 4)
            }
        }.cornerRadius(8.0)
    }
}

//struct SearchControl_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchControl(searchText: .constant(""))
//    }
//}
