//
//  MainCoordinator.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import Foundation
import SwiftUI

class MainCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    @Published var path = NavigationPath()
    
    enum Destinations {
        case vocabulary, pronunciation
    }
    
    func goToVocabularyScreen() {
        self.path.append(Destinations.vocabulary)
    }
}
