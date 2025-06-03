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
    }
    
    func goToVocabularyScreen() {
        print("before: \(path)")
        path.append(.vocabulary)
        print("after: \(path)")
    }
}
