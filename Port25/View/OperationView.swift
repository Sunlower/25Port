//
//  OperationView2.swift
//  Port25
//
//  Created by Ieda Xavier on 07/02/25.
//


import SwiftUI

struct OperationView: View {
    
    @State var whenAnimationEnd = false
    @State var popUpIsShown: Bool = true
    @State var message = "Use the **deny** and **open** buttons to block malware and allow Bob to get through."
    @State var bobOffset = -130.0
    @State var countBob = 0
    @State var countDecision = 0
//    @State var bob = "goodBob"
    
    @State var isDescriptionMessageShown = true
    @State var descriptionText = GameplayManager.shared.bobs[0].initialPhrase
    
    @ObservedObject var gameplayManager = GameplayManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack{
                    SceneMain(scene: "bg")

//                    BobView(name: gameplayManager.bobs[gameplayManager.currentLevel].image)
//                        .frame(width: geometry.size.width*1,height: geometry.size.height*1)
//                        .position(x:bobOffset, y: geometry.size.height*0.5)
                    
                    if gameplayManager.currentLevel == 0 {
                        gameplayManager.bobs[0].bobView
                            .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                            .position(x:bobOffset, y: geometry.size.height*0.5)
                    }
                    
                    if gameplayManager.currentLevel == 1 {
                        gameplayManager.bobs[1].bobView
                            .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                            .position(x:bobOffset, y: geometry.size.height*0.5)
                    }
                    
                    if gameplayManager.currentLevel == 2 {
                        gameplayManager.bobs[2].bobView
                            .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                            .position(x:bobOffset, y: geometry.size.height*0.5)
                    }
                    
                    if gameplayManager.currentLevel == 3 {
                        gameplayManager.bobs[3].bobView
                            .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                            .position(x:bobOffset, y: geometry.size.height*0.5)
                    }
                    
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
                        if isDescriptionMessageShown {
                            ZStack{
                                TaskMessage(whenAnimationEnd: $whenAnimationEnd, message: $descriptionText)
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.3)
                                    .overlay {
                                            
                                            Button {
                                                isDescriptionMessageShown = false
                                            } label: {
                                                Text("Okay")
                                                    .padding()
                                                    .cornerRadius(12)
                                                    .tint(.white)
                                                    .background(.blue)
                                            }
                                            .offset(y: geometry.size.height*0.1)
                                            
                                        }

                            }
                            .position(x: geometry.size.width*0.5, y: geometry.size.height*0.85)
                        } else {
                            HStack{
                                    HStack {
                                        Button {
                                            withAnimation(.easeInOut(duration: 1)) {
                                                self.bobOffset = -geometry.size.width*0.5
                                                gameplayManager.validateChoice(didAllowEntrance: false)
                                                
                                            } completion: {
                                                gameplayManager.nextLevel()
                                                self.bobOffset = -130.0
                                                if gameplayManager.currentLevel <= 3 {
                                                    descriptionText = gameplayManager.bobs[gameplayManager.currentLevel].initialPhrase
                                                }
                                                withAnimation(.easeInOut(duration: 1)) {
                                                    if gameplayManager.currentLevel <= 3 {
                                                        isDescriptionMessageShown = true
                                                    }
                                                    self.bobOffset = geometry.size.width*0.5
                                                }
                                            }
                                            
                                        } label: {
                                            Image("noBtn")
                                                .resizable()
                                                .frame(width: geometry.size.width*0.15, height: geometry.size.height*0.12)
                                                .position(x: geometry.size.width*0.28, y: geometry.size.height*0.92)
                                        }.buttonStyle(BorderlessButtonStyle())
                                        
                                            Button {
                                                withAnimation (.easeInOut(duration: 1)){
                                                    self.bobOffset = geometry.size.width*1.2
                                                    gameplayManager.validateChoice(didAllowEntrance: true)
                                                } completion: {
                                                    gameplayManager.nextLevel()
                                                    
                                                    self.bobOffset = -130.0
                                                    if gameplayManager.currentLevel <= 3 {
                                                        descriptionText = gameplayManager.bobs[gameplayManager.currentLevel].initialPhrase
                                                    }
                                                    
                                                    withAnimation(.easeInOut(duration: 1)) {
                                                        if gameplayManager.currentLevel <= 3 {
                                                            isDescriptionMessageShown = true
                                                        }
                                                        self.bobOffset = geometry.size.width*0.5
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
                }
            }
            .navigationBarBackButtonHidden()
            
            
        }
        
    }
}

#Preview {
    OperationView()
}
