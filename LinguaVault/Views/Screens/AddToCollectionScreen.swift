//
//  AddToCollectionScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 04..
//

import SwiftUI

struct AddToCollectionScreen: View {
    private var heightMultiplier = 0.28
    
    var body: some View {
        GeometryReader{ reader in
            VStack(alignment: .leading){
                ToLearnViewBackground(height: reader.size.height * heightMultiplier)
                
                Spacer()
                
                
                VocabularyView(
                    width: .infinity,
                    height: reader.size.height * heightMultiplier
                )
                .zIndex(10)
                
//                VStack {
//                    
//                }
//                .frame(height: reader.size.height * heightMultiplier)
//                .frame(maxWidth: .infinity)
//                .background(.white)
//                .cornerRadius(16)
//                .background {
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(.gray.secondary)
//                }
//                .rotationEffect(.degrees(1))
                
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
            .frame(width: 20, height: 30)
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
                RoundedRectangle(cornerRadius: 16)
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
                    .fontWeight(.bold)
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
                RoundedRectangle(cornerRadius: 16)
                    .fill(.gray.secondary)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "trash.fill")
                    .font(.title)
                
                Text("Already know")
                    .fontWeight(.bold)
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
