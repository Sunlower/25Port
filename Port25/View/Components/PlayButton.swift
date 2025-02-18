//
//  PlayButton.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//
import SwiftUI

struct PlayButton: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                    NavigationLink {
                        IntroView()
                    } label: {
                        Image("playBob")
                            .resizable()
                            .frame(width: geometry.size.width*0.15, height: geometry.size.width*0.22)
                    }
                    .position(x: geometry.size.width*0.5, y: geometry.size.height*0.65)
            
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PlayButton()
}
