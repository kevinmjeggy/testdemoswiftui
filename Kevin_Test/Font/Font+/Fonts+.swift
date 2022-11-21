//
//  Fonts+.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import Foundation
import SwiftUI

enum PoppinsType: String {
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
}

struct PoppinsFont: ViewModifier {
    var type: PoppinsType
    var size: CGFloat
    
    init(_ type: PoppinsType, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(type.rawValue, size: size))
    }
}

extension View {
    func Poppins(_ type: PoppinsType, size: CGFloat) -> some View {
        modifier(PoppinsFont(type, size: size))
    }
}
