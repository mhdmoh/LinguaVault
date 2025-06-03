//
//  Coordinator.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    var childCoordinators: [any Coordinator] { get set }
    var path: NavigationPath { get set }
}
