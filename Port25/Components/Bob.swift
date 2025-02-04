//
//  Bob.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//

import SwiftUI

struct Bob: View {
    @State var bob: String = "goodBob"
    var body: some View {
        GeometryReader { geometry in
          
                Image(bob)
                    .resizable()
                    .frame(width: geometry.size.width*0.2,height: geometry.size.height*0.4)
                    .position(x: geometry.size.width*0.5, y: geometry.size.height*0.5)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Bob()
}
