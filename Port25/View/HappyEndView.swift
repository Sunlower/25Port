//
//  HappyEndView.swift
//  Port25
//
//  Created by Ieda Xavier on 28/01/25.
//

import SwiftUI

struct HappyEndView: View {
    @State var whenAnimationEnd = true
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
                    SceneMain(scene: "HappyEnd")
                    
                   
                        ZStack{
                            TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: "Hello, Worl World!Hello, World!Hello, World!Hello, World!Hello, World!")
                                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.3)
                                .overlay {
                                    if whenAnimationEnd {

                                        Text("Next")
                                            .padding()
                                            .cornerRadius(12)
                                            .background(.gray)
                                            .offset(y: geometry.size.height*0.1)

                                    } else {
                                        NavigationLink {
                                            ContentView()
                                        } label: {
                                            Text("Next")
                                                .padding()
                                                .cornerRadius(12)
                                                .tint(.white)
                                                .background(.blue)

                                        }
                                        .offset(y: geometry.size.height*0.1)
                                    }
                                }

                        }
                        .position(x: geometry.size.width*0.5, y: geometry.size.height*0.85)
                    
                }
                
            }
            .navigationBarBackButtonHidden()
        }
    }

}

#Preview {
    HappyEndView()
}
