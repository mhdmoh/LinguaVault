//
//  ProgressNavigationBar.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//

import SwiftUI

struct ProgressNavigationBar: View {
    let title: String
    let step: Int
    let total: Int
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
                .font(.body.bold())
                .foregroundStyle(.white)
                .onTapGesture {
                    dismiss()
                }
            
            Spacer()
            
            VStack(spacing: 0) {
                Text(title)
                    .font(.body.bold())
                
                HStack {
                    Text(String(step))
                    
                    ProgressView(value: Float(step), total: Float(total))
                        .frame(width: 100)
                        .background(.gray.opacity(0.1))
                        .tint(.white)
                
                    Text(String(total))
                }
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .font(.body.bold())
                .foregroundStyle(.white)
                .opacity(0)
        }
        .padding()
    }
}

#Preview {
    VStack {
        ProgressNavigationBar(
            title: "Vocabulary", step: 3, total: 10
        )
        
        Spacer()
    }
    .background{
        Color(hex: "#69C2F6")
    }
}
