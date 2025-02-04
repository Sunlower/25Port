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
                    
                   
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CreditView()
}
