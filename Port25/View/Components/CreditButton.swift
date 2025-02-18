//
//  PlayButton 2.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//


import SwiftUI

struct CreditButton: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                    NavigationLink {
                        CreditView()
                    } label: {
                        Image("creditBtn")
                            .resizable()
                            .frame(width: geometry.size.width*0.1, height: geometry.size.width*0.1)

                    }
            
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CreditButton()
}
