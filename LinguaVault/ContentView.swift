//
//  ContentView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var selected: MainActions? = nil
    @State var importingData = false
    @Environment(\.dismiss) var dissmiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 16){
                    MainCardView(action: MainActions.actions[0]) {
                        VocabularySubView()
                    } delegat:  {
                        selected = MainActions.actions[0]
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    
                    MainCardView(action: MainActions.actions[1]) {
                        PronunciationSubView()
                    } delegat:  {
                        selected = MainActions.actions[1]
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
            .navigationDestination(item: $selected) { value in
                switch value.action {
                case .vocabulary:
                    LearnVocabularyView()
                case .pronunciation:
                    Text("")
                case .importData:
                    Text("")
                case .settings:
                    Text("")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
