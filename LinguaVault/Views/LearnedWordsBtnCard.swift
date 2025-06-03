//
//  LearnedWordsBtnCard.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct LearnedWordsBtnCard: View {
    private let colors = Action.vocabulary.gradientColors()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Learned")
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
            ZStack {
                buildRectangle()
                    .foregroundStyle(colors[1])
                    .cornerRadius(8)
                    .rotationEffect(.degrees(20))
                    .offset(x: 12, y: 16)
                
                buildRectangle()
                    .foregroundStyle(colors.first!)
                    .cornerRadius(8)
                    .overlay {
                        Text("A")
                            .font(.body.bold())
                            .foregroundStyle(colors.last!)
                    }
            }
            .offset(x: -36, y: -8)
        }
    }
}

private extension LearnedWordsBtnCard {
    func buildRectangle() -> some View {
        Rectangle()
            .frame(width: 36, height: 48)
    }
}

#Preview {
    LearnedWordsBtnCard()
}
