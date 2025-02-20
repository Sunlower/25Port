//
//  GhostLevel.swift
//  Port25
//
//  Created by Ieda Xavier on 20/02/25.
//



import SwiftUI

struct GhostLevel: View {
    
    @State var whenAnimationEnd = false
    @State var popUpIsShown: Bool = true
    @State var message = "Use the **deny** and **open** buttons to block malware and allow Bob to get through."
    @State var bobOffset = -130.0
    @State var countBob = 0
    @State var countDecision = 0
    let ghost = Bob(name: "ghost", description: "The man-in-the-middle (MitM) attack is a criminal method of intercepting communication between two hosts and, consequently, stealing information. The structure of the attack is basic but functional.", initialPhrase: "boooooo", isThreat: true, bobView: BobView(name: "ghostBox"), phraseDeny: "buaaaaa", phraseOpen: "buahahahahaa")
//    @State var bob = "goodBob"
    
    let gameplayManager = GameplayManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack{
                    SceneMain(scene: "bg")

//                    BobView(name: gameplayManager.bobs[gameplayManager.currentLevel].image)
//                        .frame(width: geometry.size.width*1,height: geometry.size.height*1)
//                        .position(x:bobOffset, y: geometry.size.height*0.5)
                    ghost.bobView
                        .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                        .position(x:bobOffset, y: geometry.size.height*0.5)
                    
                    Image("table")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: geometry.size.width*0.5, y: geometry.size.height*0.88)
                    
                    if popUpIsShown == true {
                        
                        
                        TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: $message)
                            .frame(width: geometry.size.width*0.4, height: geometry.size.height*0.4)
                            .overlay {
                                if whenAnimationEnd {
                                    
                                    Button(action: {
                                        withAnimation(.easeInOut(duration: 1)) {
                                            self.bobOffset = geometry.size.width*0.5
                                            popUpIsShown = false
                                        }
                                    }, label: {
                                        Text("Next")
                                            .padding()
                                            .cornerRadius(12)
                                            .tint(.white)
                                            .background(.blue)
                                    })
                                    .offset(y: geometry.size.height*0.11)
                                    
                                    
                                } else {
                                    Text("Next")
                                        .padding()
                                        .cornerRadius(12)
                                        .background(.gray)
                                        .offset(y: geometry.size.height*0.11)
                                    
                                }
                            }
                        
                        
                    } else {
                        
                        HStack {
                            Button {
//                                withAnimation(.easeInOut(duration: 1)) {
//                                    self.bobOffset = -geometry.size.width*0.5
//                                    if gameplayManager.bobs[gameplayManager.currentLevel].name == "goodBob"{
//                                        self.countBob += 1
//                                        self.countDecision -= 1
//                                    } else {
//                                        self.countBob += 1
//                                        self.countDecision += 1
//                                    }
//                                    
//                                } completion {
//                                    
//                                }
                                
                                withAnimation(.easeInOut(duration: 1), {
                                    self.bobOffset = -geometry.size.width*0.5
                                    if gameplayManager.bobs[gameplayManager.currentLevel].name == "goodBob"{
                                        self.countBob += 1
                                        self.countDecision -= 1
                                    } else {
                                        self.countBob += 1
                                        self.countDecision += 1
                                    }
                                }, completion: {
                                    print("cabo")
                                })
                                
                                
                                
                            } label: {
                                Image("noBtn")
                                    .resizable()
                                    .frame(width: geometry.size.width*0.15, height: geometry.size.height*0.12)
                                    .position(x: geometry.size.width*0.28, y: geometry.size.height*0.92)
                            }.buttonStyle(BorderlessButtonStyle())
                            
                            Button {
                                withAnimation (.easeInOut(duration: 1)){
                                    self.bobOffset = geometry.size.width*1.2
                                    if gameplayManager.bobs[gameplayManager.currentLevel].name == "goodBob"{
                                        self.countBob += 1
                                        self.countDecision += 1
                                    } else {
                                        self.countBob += 1
                                        self.countDecision -= 1
                                    }
                                    
                                }
                                
                            } label: {
                                Image("yesBtn")
                                    .resizable()
                                    .frame(width: geometry.size.width*0.15, height: geometry.size.height*0.12)
                                    .position(x: geometry.size.width*0.22, y: geometry.size.height*0.92)
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
            
            
        }
        
    }
}

#Preview {
    OperationView()
}
