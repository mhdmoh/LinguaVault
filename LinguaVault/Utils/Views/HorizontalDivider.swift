//
//  HorizontalDivider.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 03..
//

import SwiftUI

struct HorizontalDivider: View {
    
    let color: Color
    let height: CGFloat
    
    init(color: Color, height: CGFloat = 0.5) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
        color
            .frame(height: height)
    }
}
