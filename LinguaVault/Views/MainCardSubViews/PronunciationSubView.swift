//
//  PronunciationSubView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct PronunciationSubView: View {
    var body: some View {
        Image(systemName: "microphone")
            
            .font(.system(size: 60, weight: .bold))
            .foregroundStyle(Color(hex: "#95A1FE"))
            .frame(
                width: 130,
                height: 130
            )
            .background{
                RoundedRectangle(cornerRadius: 70)
                    .fill(.white)
            }
            .rotationEffect(.degrees(15), anchor: .bottomLeading)
            .background{
                RoundedRectangle(cornerRadius: 70)
                    .fill(.white.opacity(0.6))
                    .rotationEffect(.degrees(-10), anchor: .bottomLeading)
            }
            .offset(x: 70)
    }
}

#Preview {
    VStack{
        Spacer()
        
        PronunciationSubView()
        
        Spacer()
    }
}
