//
//  BadEndView.swift
//  Port25
//
//  Created by Ieda Xavier on 28/01/25.
//

import SwiftUI

struct BadEndView: View {
    @State var whenAnimationEnd = true
    @State var message = "Oh no, the malware managed to invade and infect the device. Please try again to change this final."
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
                    SceneMain(scene: "BadEnd")
                    
                   
                        ZStack{
                            TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: $message)
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
    BadEndView()
}
