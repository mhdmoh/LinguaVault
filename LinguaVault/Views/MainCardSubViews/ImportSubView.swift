//
//  ImportSubView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 15/03/2025.
//

import SwiftUI

struct ImportSubView: View {
    var body: some View {
        Image(systemName: "square.and.arrow.down")
            .font(.system(size: 60, weight: .bold))
            .foregroundStyle(Color(hex: "#FF6B6B"))
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
        
        ImportSubView()
        
        Spacer()
    }
}
