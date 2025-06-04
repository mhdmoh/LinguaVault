//
//  FlipableCardView.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 2025. 06. 04..
//

import SwiftUI

struct FlipableCardView<Front: View, Back: View>: View {
    var width: Double
    var height: Double
    
    var front: () -> Front
    var back: () -> Back
    
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            front()
                .frame(
                    width: width,
                    height: height
                )
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.secondary, lineWidth: 2)
                        .fill(.white)
                }
                .rotation3DEffect(.degrees(isFlipped ? 0 : -90), axis: (x: 0, y: 1, z: 0))
                .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            
            back()
                .frame(
                    width: width,
                    height: height
                )
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.secondary, lineWidth: 2)
                        .fill(.white)
                }
                .rotation3DEffect(.degrees(isFlipped ? 90 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(isFlipped ? .linear : .linear.delay(0.35) , value: isFlipped)
        }
        .onTapGesture(perform: {
            withAnimation(.snappy) {
                isFlipped.toggle()
            }
        })
    }
}

#Preview {
    GeometryReader{ reader in
        VStack{
            Spacer()
            FlipableCardView(
                width: reader.size.width * 0.8,
                height: reader.size.height * 0.28
            ) {
                Text("Front")
            } back: {
                Text("Back")
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            .blue
        )
    }
}
