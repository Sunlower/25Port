//
//  ContentView.swift
//  Port25
//
//  Created by Ieda Xavier on 23/01/25.
//

import SwiftUI
//estudar navigationlink

struct ContentView: View {
    @State var isPopUpShow = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
                    SceneMain()
                    
                    ZStack{
                        
                        PlayButton()
                            .position(x: geometry.size.width*0.5, y: geometry.size.height*0.55)
                        
                        CreditButton()
                            .position(x: geometry.size.width*1.3, y: geometry.size.height*0.55)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
