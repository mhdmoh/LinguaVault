//
//  LearnVocabularyView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI
import AVFoundation

struct LearnVocabularyView: View {
    private var action = Action.vocabulary
    @StateObject var viewModel = VocabularyViewModel()
    
    func normalize(_ value: Int, count: Int) -> Double {
        guard count > 0 else { return 0 } // Prevent division by zero
        return Double(value) / Double(count)
    }
    
    var body: some View {
        GeometryReader{ reader in
            VStack {
                ProgressNavigationBar(title: action.rawValue, step: viewModel.total - viewModel.words.count + 1, total: viewModel.total)
                
                Spacer()
                
                ZStack{
                    ForEach(Array(viewModel.words.enumerated()), id: \.offset) { index, word in
                        HorizontalFlashCardView(
                            width: reader.size.width * 0.8,
                            height: reader.size.height * 0.5
                        ){
                            withAnimation{
                                viewModel.remove(at: index)
                            }
                        }
                        .scaleEffect(1.0 - (Double(viewModel.words.count - (index + 1)) * 0.1))
                        .opacity(index < viewModel.words.count - 3 ? 0 : index == viewModel.words.count - 1 ? 1 :   Double(index) / Double(viewModel.words.count - 1) * 0.7)
                        .offset(y: Double((viewModel.words.count - index) * 30))
                    }
                }
                
                
                Spacer()
                Spacer()
                
                Button("Show Example Sentences") {
                    
                }
                .buttonStyle(.main())
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .gradientBackground(using: action.gradientColors())
    }
}

#Preview {
    LearnVocabularyView()
}
