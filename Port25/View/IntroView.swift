//
//  IntroView.swift
//  Port25
//
//  Created by Ieda Xavier on 23/01/25.
//

import SwiftUI

struct IntroView: View {
    @State var whenAnimationEnd = true
    @State var message = "Hello, World!Hello, l"
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
                    SceneMain(scene: "bg")
                    
                    Bob()
                        .position(x: geometry.size.width*0.75, y: geometry.size.height*0.55)
                    
                    
                        ZStack{
                            TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: $message)
                                .frame(width: geometry.size.width*0.5, height: geometry.size.height*0.5)
                                .overlay {
                                    if whenAnimationEnd {

                                        Text("Next")
                                            .padding()
                                            .cornerRadius(12)
                                            .background(.gray)
                                            .offset(y: geometry.size.height*0.16)

                                    } else {
                                        NavigationLink {
                                            VirusView()
                                        } label: {
                                            Text("Next")
                                                .padding()
                                                .cornerRadius(12)
                                                .tint(.white)
                                                .background(.blue)

                                        }
                                        .offset(y: geometry.size.height*0.16)
                                    }
                                }

                        }
                        .position(x: geometry.size.width*0.3, y: geometry.size.height*0.55)
                    
                }
                
            }
            .navigationBarBackButtonHidden()
        }
    }

}

#Preview {
    IntroView()
}
