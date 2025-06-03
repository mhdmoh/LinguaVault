//
//  MainButtonStyle.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
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

extension ButtonStyle where Self == MainButtonStyle {
    static var main: MainButtonStyle {
        MainButtonStyle()
    }
}
