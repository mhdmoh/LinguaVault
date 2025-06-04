//
//  VocabularyView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 04..
//

import SwiftUI

struct VocabularyView: View {
    var width: Double
    var height: Double
    
    var body: some View {
        FlipableCardView(width: width, height: height) {
            VStack {
                Spacer()
                
                Text("Excuse Me")
                    .font(.title.bold())
                
                Spacer()
                Divider()
                    .padding()
                
                Text("Tap to hide the transaction")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
            }
        } back: {
            VStack {
                Spacer()
                
                Text("Entschuldigung")
                    .font(.title.bold())
                
                HStack {
                    Text("ɛntʃʊldɪgʊŋ")
                        .foregroundStyle(.gray)
                    
                    Image(systemName: "speaker.wave.2")
                        .foregroundStyle(.blue)
                }
                .onTapGesture {
                    SpeechManager.shared.speak(text: "Entschuldigung", language: "de-DE")
                }
                
                Spacer()
                
                Divider()
                    .padding()
                
                Text("Tap to show the transaction")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                
            }
        }
    }
}

#Preview {
    GeometryReader{ reader in
        VStack{
            Spacer()
            VocabularyView(
                width: reader.size.width * 0.8,
                height: reader.size.height * 0.5
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            .blue
        )
    }
}
