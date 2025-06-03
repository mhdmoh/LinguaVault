//
//  VocabularyViewModel.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//


import Foundation

@MainActor
class VocabularyViewModel: ObservableObject {
    @Published var words : [String] = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
    ]
    
    var total = 0
    
    init() {
        total = words.count
    }
    
    func remove(at index: Int) {
        words.remove(at: index)
    }
}
