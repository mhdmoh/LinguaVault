//
//  ButtonStyles.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import Foundation
import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        .white.opacity(0.2)
                    )
            }
    }
}

struct MainButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var labelColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            Rectangle()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .foregroundStyle(backgroundColor.gradient.secondary)
            
            configuration
                .label
                .textCase(.uppercase)
                .font(.body.bold())
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .foregroundStyle(labelColor)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            backgroundColor
                        )
                }
                .offset(y: configuration.isPressed ? 0 : -6)
        }
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: SecondaryButtonStyle {
        SecondaryButtonStyle()
    }
    
    static func main(backgroundColor: Color = .accentColor, labelColor: Color = .white) -> MainButtonStyle {
        MainButtonStyle(
            backgroundColor: backgroundColor,
            labelColor: labelColor
        )
    }
}
