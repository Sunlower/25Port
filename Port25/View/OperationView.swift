//
//  Operation.swift
//  Port25
//
//  Created by Ieda Xavier on 23/01/25.
//

import SwiftUI

struct OperationView: View {
    @State var whenAnimationEnd = false
    @State var popUpIsShown: Bool = false
    @State var message = "xxxx"
    @State var bobOffset = 0.0
    @State var countBob = 0
    @State var countDecision = 0
    @State var bob = "goodBob"
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    SceneMain(scene: "bg")
                    /*
                    Image("courtine")
                        .resizable()
                        .frame(width: geometry.size.width*1, height: geometry.size.height*1)
                        .position(x: geometry.size.width*0.5, y: geometry.size.height*0.5)
                    */
                    
                    Bob(bob: bob)
                        .frame(width: geometry.size.width*1,height: geometry.size.height*1)
                        //.position(x: geometry.size.width*0.5, y: geometry.size.height*0.5)
                        .offset(x: bobOffset)
                        .animation(.easeInOut(duration: 0.7))
                    
                    Image("table")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width*1)
                        .position(x: geometry.size.width*0.5, y: geometry.size.height*0.9)
                    
                    HStack{
                        
                        
                        if countBob == 2 {
                            if countDecision == 3 {
                                
                                NavigationLink {
                                    HappyEndView()
                                } label: {
                                    Image("noBtn")
                                        .resizable()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                        .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)

                                }
                                
                            } else {
                                NavigationLink {
                                    BadEndView()
                                } label: {
                                    Image("noBtn")
                                        .resizable()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                        .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)

                                }
                            }
                            
                        } else {
                            Button {
                                withAnimation {
                                    self.bobOffset -= geometry.size.width*0.7
                                    if bob == "goodBob"{
                                        self.countBob += 1
                                        self.countDecision -= 1
                                    } else {
                                        self.countBob += 1
                                        self.countDecision += 1
                                    }
                                    
                                }
                                
                            } label: {
                                Image("noBtn")
                                    .resizable()
                                    .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                    .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                        
                        if countBob == 3 {
                            if countDecision == 3 {
                                
                                NavigationLink {
                                    HappyEndView()
                                } label: {
                                    Image("yesBtn")
                                        .resizable()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                        .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)

                                }
                                
                            } else {
                                NavigationLink {
                                    BadEndView()
                                } label: {
                                    Image("yesBtn")
                                        .resizable()
                                        .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                        .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)

                                }
                            }
                            
                        } else {
                            Button {
                                withAnimation {
                                    self.bobOffset += geometry.size.width*0.7
                                    if bob == "goodBob"{
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
                                    .frame(width: geometry.size.width*0.2, height: geometry.size.height*0.15)
                                    .position(x: geometry.size.width*0.25, y: geometry.size.height*0.9)
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    
                    ZStack{
                        if popUpIsShown == true {
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
                                            
                                            Button(action: {
                                               
                                                withAnimation {
                                                    self.bobOffset += geometry.size.width*0.7
                                                    self.popUpIsShown.toggle()
                                                    
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
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    OperationView()
}
