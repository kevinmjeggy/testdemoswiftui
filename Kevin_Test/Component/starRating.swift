//
//  starRating.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import SwiftUI

struct starRating: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var onImage = Image("StarFilled")
    var offImage = Image("Star")
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center, spacing: 2) {
                ForEach(1 ..< maximumRating + 1, id: \.self) { number in
                    image(for: number)
                    }
            }
            Text(label).Poppins(.regular, size: 10)
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
}

struct starRating_Previews: PreviewProvider {
    static var previews: some View {
        starRating(rating: .constant(4))
    }
}
