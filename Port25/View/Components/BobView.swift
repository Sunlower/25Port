//
//  Bob.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//

import SwiftUI

struct BobView: View {
    @State var name: String = "goodBob"
    var body: some View {
        GeometryReader { geometry in
          
                Image(name)
                    .resizable()
                    .frame(width: geometry.size.width*0.2,height: geometry.size.height*0.4)
                    .position(x: geometry.size.width*0.5, y: geometry.size.height*0.5)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BobView()
}
