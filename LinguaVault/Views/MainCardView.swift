//
//  MainCardView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

enum Action: String, CaseIterable {
    case vocabulary = "Vocabulary"
    case pronunciation = "Pronunciation"
    case importData = "Import"
    case settings = "Settings"
}

extension Action {
    func gradientColors() -> [Color] {
        switch self {
        case .vocabulary:
            return [
                Color(hex: MainActions.actions[0].hexColor).mix(with: .white , by: 0.4),
                Color(hex: MainActions.actions[0].hexColor),
                Color(hex: MainActions.actions[0].hexColor).mix(with: .black , by: 0.4)
            ]
        case .pronunciation:
            return []
        case .importData:
            return []
        case .settings:
            return []
        }
    }
    
    func mainAction() -> MainActions {
        return MainActions.actions[Action.allCases.firstIndex(of: self)!]
    }
}

struct MainActions: Identifiable, Hashable {
    
    var progress: Double
    var hexColor: String
    var subtitle: String
    var action: Action
    
    var id: Int {
        action.hashValue
    }
    
    static let actions: [MainActions] = [
        .init(
            progress: 0.5,
            hexColor: "#69C2F6",
            subtitle: "Goten Tag!",
            action: .vocabulary
        ),
        
        .init(
            progress: 0.8,
            hexColor: "#95A1FE",
            subtitle: "/go:tən ta:k/",
            action: .pronunciation
        ),
    
        .init(
            progress: 0,
            hexColor: "#FF6B6B",
            subtitle: "Add New Vocabulary",
            action: .importData
        ),
    
        .init(
            progress: 0,
            hexColor: "#C0C0C0",
            subtitle: "Change Configs",
            action: .settings
        )
    ]
}

struct MainCardView<Content: View> : View {
    let action: MainActions
    var height: CGFloat = 200
    let subView: () -> Content
    let delegat: () -> Void
    
    
    var body: some View {
        ZStack(alignment: .trailing){
            HStack{
                VStack(alignment: .leading,spacing: 0) {
                    if action.progress > 0 {
                        ProgressView(value: action.progress)
                            .frame(width: 60)
                            .foregroundStyle(.white)
                            .background(.gray.opacity(0.1))
                            .tint(.white)
                    }
                    
                    Spacer()
                    
                    Text(action.action.rawValue)
                        .font(.title.bold())
                    
                    Text(action.subtitle)
                        .font(.caption)
                }
                
                Spacer()
            }
            
            subView()
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .padding(26)
        .frame(height: height)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: action.hexColor))
        }
        .clipped()
        .onTapGesture {
            delegat()
        }
    }
}


#Preview {
    VStack{
        Spacer()
        
        MainCardView(action: MainActions.actions[1]) {
            PronunciationSubView()
        } delegat:  {
            
        }
        .padding()
        
        Spacer()
    }
}
