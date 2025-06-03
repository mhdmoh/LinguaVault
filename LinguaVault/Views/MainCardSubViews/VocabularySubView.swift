//
//  VocabularySubView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct VocabularySubView: View {
    var body: some View {
        Text("A")
            .font(.system(size: 60, weight: .bold))
            .foregroundStyle(Color(hex: "#69C2F6"))
            .frame(
                width: 110,
                height: 150
            )
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            }
            .rotationEffect(.degrees(15), anchor: .bottomLeading)
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.6))
                    .rotationEffect(.degrees(-5), anchor: .bottomLeading)
            }
            .offset(x: 50)
    }
}

#Preview {
    VocabularySubView()
}
