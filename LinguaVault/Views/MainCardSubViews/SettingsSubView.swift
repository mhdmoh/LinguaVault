//
//  SettingsSubView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 05. 15..
//

import SwiftUI

struct SettingsSubView: View {
    var body: some View {
        Image(systemName: "gear")
            .font(.system(size: 60, weight: .bold))
            .foregroundStyle(Color(hex: "#C0C0C0"))
            .frame(
                width: 100,
                height: 100
            )
            .background{
                RoundedRectangle(cornerRadius: 70)
                    .fill(.white)
            }
            .rotationEffect(.degrees(8), anchor: .bottomLeading)
            .background{
                RoundedRectangle(cornerRadius: 70)
                    .fill(.white.opacity(0.6))
                    .rotationEffect(.degrees(-10), anchor: .bottomLeading)
            }
            .offset(x: 60, y: -30)
    }
}

#Preview {
    VStack{
        Spacer()
        
        SettingsSubView()
        
        Spacer()
    }
}
