//
//  MainCoordinator.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import Foundation
import SwiftUI

@MainActor
class MainCoordinator: ObservableObject {
    @Published var path = [Destinations]()
    
    enum Destinations {
        case vocabulary
        case pronunciation
        case learnedVocabulary
        case vocabularyDetails
        case addToCollection
    }
    
    func goToVocabularyScreen() {
        path.append(.vocabulary)
    }
    
    func goToAddToCollectionScreen(){
        path.append(.addToCollection)
    }
    
    func goToVocabularyDetailsScreen() {
        path.append(.vocabularyDetails)
    }
    
    func goToLearnedVocabularyScreen() {
        path.append(.learnedVocabulary)
    }
}
