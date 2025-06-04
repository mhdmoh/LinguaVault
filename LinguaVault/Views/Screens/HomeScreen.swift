//
//  HomeScreen.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct HomeScreen: View {
    @State var importingData = false
    @StateObject var coordinator = MainCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path){
            ScrollView{
                VStack(spacing: 16){
                    MainCardView(action: MainActions.actions[0]) {
                        VocabularySubView()
                    } delegat:  {
                        coordinator.goToVocabularyDetailsScreen()
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    
                    MainCardView(action: MainActions.actions[1]) {
                        PronunciationSubView()
                    } delegat:  {
                        
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        MainCardView(action: MainActions.actions[2]) {
                            ImportSubView()
                        } delegat:  {
                            importingData = true
                        }
                        
                        MainCardView(action: MainActions.actions[3]) {
                            SettingsSubView()
                        } delegat:  {
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .fileImporter(isPresented: $importingData, allowedContentTypes: [.commaSeparatedText]) { result in
                switch result {
                case .success(let url):
                    do{
                        let url = try DataImporter.shared.accessSecuredURL(url: url)
                        if let csvData = DataImporter.shared.getCSVData(from: url) {
                            let vocaList = DataImporter.shared.convertCSVToVocabularyList(csvData)
                            print(vocaList[0].word)
                        } else {
                            throw LVErrors.unableToParseCSV
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                case .failure(let error):
                    print("File selection error: \(error.localizedDescription)")
                }
                importingData = false
            }
            .navigationTitle("It's Practice Time!")
            .navigationDestination(for: MainCoordinator.Destinations.self) { value in
                switch value {
                case .vocabularyDetails:
                    VocabularyDetailsScreen()
                case .learnedVocabulary:
                    LearnedVocabularyScreen()
                case .vocabulary:
                    LearnVocabularyView()
                case .addToCollection:
                    AddToCollectionScreen()
                case .pronunciation:
                    Text("")
                }
            }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    HomeScreen()
}
