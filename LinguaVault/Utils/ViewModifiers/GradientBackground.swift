//
//  GradientBackground.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct GradientBackground: ViewModifier {
    var colors: [Color]
    
    func body(content: Content) -> some View {
        content
            .background{
                LinearGradient(
                    colors: colors,
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
    }
}

extension View {
    func gradientBackground(using colors: [Color]) -> some View {
        return self.modifier(GradientBackground(colors: colors))
    }
}
