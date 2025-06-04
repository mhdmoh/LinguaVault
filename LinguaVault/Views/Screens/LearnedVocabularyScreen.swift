//
//  LearnedVocaScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct LearnedVocabularyScreen: View {
    @EnvironmentObject var coordinator: MainCoordinator
    
    private var colors = Action.vocabulary.gradientColors()
    func buildRectangle() -> some View {
        Rectangle()
            .frame(width: 56, height: 68)
    }
    
    var body: some View {
        ScrollView{
            VStack {
                VStack(alignment: .leading, spacing: 40){
                    HStack {
                        Text("Practice your learned words")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
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
                        .padding(.trailing)
                    }
                    
                    Button("Practice") {
                        coordinator.goToVocabularyScreen()
                    }
                    .buttonStyle(.main())
                }
                .padding()
                
                HorizontalDivider(color: .accentColor, height: 2)
                
                HStack {
                    Text("20 words")
                        .font(.title3.bold())
                    Spacer()
                    
                    Button("SORT") {
                        
                    }
                    .fontWeight(.bold)
                }
                .padding()
                
                VStack(spacing: 0){
                    ForEach(0..<20) { index in
                        LearnedVocaItemView()
                            .padding()
                        
                        if index != 19 {

                            HorizontalDivider(color: .accentColor, height: 2)
                        }
                        
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            Color.accentColor, lineWidth: 2
                        )
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    NavigationStack{
        LearnedVocabularyScreen()
    }
}

struct LearnedVocaItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "speaker.wave.2.fill")
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading){
                Text("Entschuldigung")
                    .font(.body.bold())
                
                Text("Excuse me")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 8)
            
            Spacer()
        }
    }
}
