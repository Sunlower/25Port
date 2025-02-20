//
//  VirusView.swift
//  Port25
//
//  Created by Ieda Xavier on 23/01/25.
//

import SwiftUI

struct VirusView: View {
    @State var whenAnimationEnd = true
    @State private var bounceGhost = true
    @State private var bounceMalware = false
    @State private var bounceTrojan = false
    @State var count = 0
    @State var message = "The man-in-the-middle (MitM) attack is a criminal method of intercepting communication between two hosts and, consequently, stealing information. The structure of the attack is basic but functional."
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                ZStack {
                    SceneMain(scene: "bg")
                    
                    BobView(name: "ghostBob")
                        .position(x: geometry.size.width*0.25, y: geometry.size.height*0.5)
                        .scaleEffect(bounceGhost ? 1.3 : 1.0, anchor: .center)
                    
                    BobView(name: "spywareBob")
                        .scaleEffect(bounceMalware ? 1.3 : 1.0, anchor: .center)
                    
                    BobView(name: "trojanBob")
                        .position(x: geometry.size.width*0.75, y: geometry.size.height*0.5)
                        .scaleEffect(bounceTrojan ? 1.3 : 1.0, anchor: .center)
                    
                    ZStack{
                        TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: $message)
                            .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.25)
                            .overlay {
                                if whenAnimationEnd {

                                    Text("Next")
                                        .padding()
                                        .cornerRadius(12)
                                        .background(.gray)
                                        .offset(x: geometry.size.width*0.4,y: geometry.size.height*0.06)

                                } else {
                                    
                                    if count > 1 {
                                        
                                        
                                        NavigationLink {
                                            OperationView()
//                                            GhostLevel()
                                        } label: {
                                            Text("Next")
                                                .padding()
                                                .cornerRadius(12)
                                                .tint(.white)
                                                .background(.blue)

                                        }
                                        .offset(x: geometry.size.width*0.4,y: geometry.size.height*0.06)
                                        
                                    } else {
                                        
                                        Button(action: {
                                            withAnimation(.interpolatingSpring(stiffness: 170, damping: 5)) {
                                                if count == 0 {
                                                    message = "Spyware installs itself on a device without providing adequate warning or without the person's consent. Once installed, it can monitor online behavior, collect sensitive information, alter device settings, and reduce device performance."
                                                        
                                                    self.bounceGhost.toggle()
                                                    self.bounceMalware.toggle()
                                                    count+=1
                                                } else {
                                                    message = "A Trojan is malicious software capable of disguising itself as common programs to infect a device. This type of malware is widely used by cybercriminals, hackers, or security institutions to discreetly infiltrate computers."
                                                    self.bounceMalware.toggle()
                                                    self.bounceTrojan.toggle()
                                                    count+=1
                                                }
                                                
                                            }
                                        }, label: {
                                            Text("Next")
                                                .padding()
                                                .cornerRadius(12)
                                                .tint(.white)
                                                .background(.blue)
                                        })
                                        .offset(x: geometry.size.width*0.4,y: geometry.size.height*0.06)
                                    }
                                }
                            }
                            

                    }
                    .position(x: geometry.size.width*0.5, y: geometry.size.height*0.85)

                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    VirusView()
}
