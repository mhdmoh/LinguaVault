//
//  MistakesBtnCard.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct MistakesBtnCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Mistakes")
                    .font(.title3.bold())
                
                Text("137 words")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding()
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: Action.vocabulary.mainAction().hexColor), lineWidth: 2)
        )
        .cornerRadius(16)
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .overlay(alignment: .trailing) {
            Circle()
                .padding(8)
                .foregroundStyle(.orange)
                .overlay {
                    Image(systemName: "arrow.trianglehead.2.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                        .font(.body.bold())
                        .padding(24)
                    
                }
                .offset(y: 20)
        }
        .clipped()
    }
}

#Preview {
    MistakesBtnCard()
}
