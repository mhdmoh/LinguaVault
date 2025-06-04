//
//  AddNewVocabularySectionView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 04..
//

import SwiftUI

struct AddNewVocabularySectionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Learn new words from your collection")
                .font(.title.bold())
    
            Button("Learn") {
                
            }
            .buttonStyle(.main())
        }
    }
}

#Preview {
    AddNewVocabularySectionView()
        .padding()
}
