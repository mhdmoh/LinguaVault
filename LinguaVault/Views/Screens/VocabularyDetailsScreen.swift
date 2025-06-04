//
//  VocabularyScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct VocabularyDetailsScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            AddNewVocabularySectionView()
            Divider()
            
            LearnedWordsBtnCard()
            MistakesBtnCard()
            Spacer()
        }
        .padding()
        .navigationTitle("Your collection")
    }
}

#Preview {
    VocabularyDetailsScreen()
}
