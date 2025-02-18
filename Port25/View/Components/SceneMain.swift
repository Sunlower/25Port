//
//  SceneMain.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//

import SwiftUI

struct SceneMain: View {
    
    @State var scene: String = "bgInitial"
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(scene)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width*1)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SceneMain()
}
