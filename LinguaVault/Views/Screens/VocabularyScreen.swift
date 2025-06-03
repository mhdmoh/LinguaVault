//
//  VocabularyScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct VocabularyScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            LearnedWordsBtnCard()
            MistakesBtnCard()
            Spacer()
        }
        .padding()
        .navigationTitle("Your collection")
    }
}

#Preview {
    VocabularyScreen()
}
