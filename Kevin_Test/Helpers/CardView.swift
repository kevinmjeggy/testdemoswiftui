//
//  CardView.swift
//  Kevin_Test
//
//  Created by Kevin on 19/11/22.
//

import SwiftUI

struct CardView<Content: View>: View {
    var strokeColor: Color
    var paddingVal: CGFloat = 20
    var cornerRadius: CGFloat = 8
    var backgroundColor: Color = .white
    var content: Content

    init(strokeColor: Color, paddingVal: CGFloat = 20, backgroundColor: Color = .white, cornerRadius: CGFloat = 8, @ViewBuilder content: () -> Content) {
        self.strokeColor = strokeColor
        self.paddingVal = paddingVal
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    var body: some View {
        content
            .egCardView(backgroundColor: backgroundColor, cornerRadius: cornerRadius, padding: paddingVal, stroke: strokeColor)
    }
}

extension View {
    func egCardView(foregroundColor: Color = .black, backgroundColor: Color = .gray.opacity(0.4), cornerRadius: CGFloat = 8, padding: CGFloat = 8, stroke: Color = .gray) -> some View {
        modifier(Border(backgroundColor: backgroundColor, cornerRadius: cornerRadius, padding: padding, stroke: stroke))
    }
}

struct Border: ViewModifier {
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var padding: CGFloat
    var stroke: Color

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(stroke, lineWidth: 1)
            )
    }
}
