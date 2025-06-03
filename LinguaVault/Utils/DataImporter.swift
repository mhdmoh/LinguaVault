//
//  DataImporter.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 15/03/2025.
//

import Foundation

class DataImporter {
    static let shared = DataImporter()
    
    private init() {}
    
    func accessSecuredURL(url: URL) throws -> URL {
        if url.startAccessingSecurityScopedResource() {
            defer { url.stopAccessingSecurityScopedResource() }
            return url
        } else {
            throw LVErrors.unableToAccessFile
        }
    }
    
    func getCSVData(from fileURL: URL) -> [[String]]? {
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            let lines = content.components(separatedBy: "\n").filter { !$0.isEmpty }
            let csvData = lines.map { $0.components(separatedBy: ",") }
            
            return csvData
        } catch {
            print("Error reading CSV file: \(error.localizedDescription)")
            return nil
        }
    }
    
    func convertCSVToVocabularyList(_ csvData: [[String]]) -> [VocabularyItem] {
        var vocabularyList: [VocabularyItem] = []
        
        guard csvData.count > 1 else { return [] } // Ensure there's data after the header
        let dataRows = csvData.dropFirst() // Skip header row
        
        for row in dataRows {
            guard row.count >= 6 else { continue } // Ensure minimum required columns exist
            
            let article = row[1]
            let word = row[2]
            let translation = row[3]
            let pronunciation = row[4]
            let exampleSentence = row.count > 7 ? row[7] : ""
            
            // Combine article and word
            let fullWord = article.isEmpty ? word : "\(article) \(word)"
            
            // Modify translation if article exists
            let finalTranslation = article.isEmpty ? translation : "The \(translation)"
            
            // Create VocabularyItem
            let vocabItem = VocabularyItem(
                word: fullWord,
                translation: finalTranslation,
                pronunciation: pronunciation,
                examples: exampleSentence.isEmpty ? [] : [exampleSentence]
            )
            
            vocabularyList.append(vocabItem)
        }
        
        return vocabularyList
    }
}

struct VocabularyItem {
    let word: String
    let translation: String
    let pronunciation: String
    let examples: [String]
}
