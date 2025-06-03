//
//  VocabularyView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct VocabularyView: View {
    let width: CGFloat
    let height: CGFloat
    let finished: () -> Void
    
    @State private var vocaCase: VocabularyCase? = nil
    @State private var offset = CGSize.zero
    @State private var isFlipped = false
    
    var color: Color {
        switch vocaCase {
        case .memorized:
            Color(hex: "#71E7BD")
        case .forgotten:
            Color(hex: "#588DED")
        case nil:
            .clear
        }
    }
    
    private enum VocabularyCase: String {
        case memorized = "I Know It"
        case forgotten = "Repeat It"
    }

    
    private func handleSwipe(width: CGFloat) {
        switch width {
        case -500...(-120):
            offset = CGSize(width: -500, height: .zero)
            finished()
        case 120...500:
            offset = CGSize(width: 500, height: .zero)
            finished()
        default:
            offset = .zero
        }
    }
    
    private func handleCase(width: CGFloat) {
        switch width {
        case -500...(-120):
            vocaCase = .forgotten
        case 120...500:
            vocaCase = .memorized
        default:
            vocaCase = nil
        }
    }
    
    
    var body: some View {
        ZStack {
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
            .frame(
                width: width,
                height: height
            )
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            }
            .rotation3DEffect(.degrees(isFlipped ? 0 : -90), axis: (x: 0, y: 1, z: 0))
            .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            
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
                
            }.frame(
                width: width,
                height: height
            )
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            }
            .rotation3DEffect(.degrees(isFlipped ? 90 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(isFlipped ? .linear : .linear.delay(0.35) , value: isFlipped)
            
           
            
            if let vocaCase {
                VStack {
                    Text(vocaCase.rawValue)
                        .font(.title.bold())
                        .foregroundStyle(.white)
                }
                .frame(
                    width: width - 20,
                    height: height - 20
                )
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                        .stroke(color.opacity(0.8), lineWidth: 20)
                }
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .onTapGesture(perform: {
            withAnimation(.snappy) {
                isFlipped.toggle()
            }
        })
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        handleCase(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        handleSwipe(width: offset.width)
                    }
                }
        )
    }
}

#Preview {
    GeometryReader{ reader in
        VStack{
            Spacer()
            VocabularyView(
                width: reader.size.width * 0.8,
                height: reader.size.height * 0.5
            ) {
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            .blue
        )
    }
}
