//
//  TaskMessage.swift
//  Port25
//
//  Created by Ieda Xavier on 25/01/25.
//

import SwiftUI

struct TaskMessage: View {
    @Binding var whenAnimationEnd: Bool
    @State private var text1: String = ""
    @State var aux = 0
    @State var rangeMarkdown: (startIndex: Int?, endIndex: Int?) = (nil, nil)
    @Binding var message: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .overlay {
                        Text(text1)
                            .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.9)
                            .font(.title)
                            .offset(y: -30)
                    }

            }
            .onAppear {
                typeWriter1 {
                    whenAnimationEnd.toggle()
                }
            }
            .onChange(of: message) {
                whenAnimationEnd.toggle()
                typeWriter1 {
                    whenAnimationEnd.toggle()
                }
            }
        }
    }


    func typeWriter1(at position: Int = 0, completion: @escaping (() -> Void)) {

        if position == 0 {
            text1 = ""
        }
        if position < message.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0004) {
                if message[position] == "*" {
                    aux += 1
                    text1.append("")
                    typeWriter1(at: position + 1, completion: completion)
                    if aux == 2 {
                        rangeMarkdown.startIndex = position-1
                    }
                    if aux == 3 {
                        rangeMarkdown.endIndex = position
                    }
                } else {
                    text1.append(message[position])
                    typeWriter1(at: position + 1, completion: completion)
                }

            }
        }
        if position == message.count {
            completion()
            if let startRange = rangeMarkdown.startIndex {
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: startRange))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: startRange))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: rangeMarkdown.endIndex!))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: rangeMarkdown.endIndex!))
            }
        }

    }
}


import Foundation

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
