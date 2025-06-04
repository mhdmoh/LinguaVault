//
//  AddToCollectionScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 04..
//

import SwiftUI

struct AddToCollectionScreen: View {
    private var heightMultiplier = 0.28
    
    @State private var offset = CGSize.zero
    @State private var state: AddState? = nil
    
    enum AddState {
        case add
        case ignore
    }
    
    private func handleSwipe(value: CGFloat) {
        switch value {
        case -500...(-120):
            offset = CGSize(width: .zero, height: -256)
            state = .add
        case 120...500:
            offset = CGSize(width: .zero, height: 256)
            state = .ignore
        default:
            offset = .zero
        }
    }
    
    var body: some View {
        GeometryReader{ reader in
            VStack(alignment: .leading){
                ToLearnViewBackground(height: reader.size.height * heightMultiplier)
                
                Spacer()
                
                
                ZStack {
                    VocabularyView(
                        width: .infinity,
                        height: reader.size.height * heightMultiplier
                    )
                    .rotationEffect(.degrees(-3))
                    
                    VocabularyView(
                        width: .infinity,
                        height: reader.size.height * heightMultiplier
                    )
                    .rotationEffect(.degrees(1))
                    
                    VocabularyView(
                        width: .infinity,
                        height: reader.size.height * heightMultiplier
                    )
                    .rotationEffect(.degrees(state != nil ? 0 : -1))
                    .scaleEffect(x: state != nil ? 0.8 : 1)
                    .scaleEffect(y: state != nil ? 0.8 : 1)
                    .offset(x: offset.width * 0.2, y: offset.height )
                    .rotationEffect(.degrees(state != nil ? 0 : -1 * Double(offset.height / 50)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                withAnimation {
                                    handleSwipe(value: offset.height)
                                }
                            }
                    )
                }
                .zIndex(10)
                
                Spacer()
                
                ToIgnoreViewBackground(height: reader.size.height * heightMultiplier)
            }
            .padding()
            .background(Color.background)
        }
    }
}

private struct ToLearnViewBackground: View {
    var height: Double
    
    private func buildRectangle() -> some View {
        Rectangle()
            .frame(width: 16, height: 24)
            .foregroundStyle(.green)
            .cornerRadius(2)
            .background {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(.white, lineWidth: 2)
            }
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
            }
            
            HStack(spacing: 16) {
                ZStack {
                    buildRectangle()
                        .rotationEffect(.degrees(20))
                        .offset(x: 8, y: 4)
                    
                    buildRectangle()
                        .rotationEffect(.degrees(-8))
                }
                
                Text("To learn")
                    .font(.caption.bold())
                    .foregroundStyle(.green)
            }
            .padding(12)
            .padding(.horizontal, 8)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.background)
            }
            .offset(y: 25)
        }
    }
}

private struct ToIgnoreViewBackground: View {
    var height: Double
    
    var body: some View {
        ZStack(alignment: .top){
            VStack {
                
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.secondary)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "trash.fill")
                    .font(.title3)
                
                Text("Already know")
                    .font(.caption.bold())
            }
            .foregroundStyle(.gray.secondary)
            .padding(12)
            .padding(.horizontal, 8)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.background)
            }
            .offset(y: -25)
        }
    }
}

#Preview {
    NavigationStack{
        AddToCollectionScreen()
    }
}
