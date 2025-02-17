//
//  CreditView.swift
//  Port25
//
//  Created by Ieda Xavier on 28/01/25.
//

import SwiftUI
//estudar navigationlink

struct CreditView: View {
    @State var isPopUpShow = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
                    SceneMain(scene: "bg")
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(width: geometry.size.width * 0.8 ,height: geometry.size.height * 0.7)
                        .overlay {
                            VStack(alignment: .leading){
                                Text("Credits")
                                    .font(.system(size: 28,
                                                  weight: .bold,
                                                  design: .rounded))
                                    .foregroundStyle(Color.init(red: 32/255,
                                                                green: 49/255,
                                                                blue: 55/255))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                HStack{
                                    VStack{
                                        Text("Images")
                                            .font(.system(size: 28,
                                                          weight: .bold,
                                                          design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255,
                                                                        green: 49/255,
                                                                        blue: 55/255))
                                            .multilineTextAlignment(.center)
                                        
                                        Text("Images made by me, using the plataform Asesprite")
                                            .font(.system(size: 28,
                                                          weight: .bold,
                                                          design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255,
                                                                        green: 49/255,
                                                                        blue: 55/255))
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Text("Code")
                                            .font(.system(size: 28,
                                                          weight: .bold,
                                                          design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255,
                                                                        green: 49/255,
                                                                        blue: 55/255))
                                            .multilineTextAlignment(.center)
                                        
                                        
                                        Text("Images made by me, using the plataform Asesprite")
                                            .font(.system(size: 28,
                                                          weight: .bold,
                                                          design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255,
                                                                        green: 49/255,
                                                                        blue: 55/255))
                                            .multilineTextAlignment(.center)
                                    }
                                }
                            }
                            .padding(130)
                        }
                        
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CreditView()
}
