//
//  Level.swift
//  Port25
//
//  Created by Ieda Xavier on 07/02/25.
//

import SwiftUI

struct LevelView: View {
    @State var whenAnimationEnd = false
    @State var popUpIsShown: Bool = true
    @State var message = "xxxx"
    @State var bobOffset = 0.0
    @State var countBob = 0
    @State var countDecision = 0
    @State var bob = "goodBob"
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    
                    Bob(bob: bob)
                        .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                        .position(x: geometry.size.width*0.5, y: geometry.size.height*0.5)
                        .offset(x: bobOffset)
                        .animation(.easeInOut(duration: 0.7))
                    
                    
                    
                    
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LevelView()
}

