//
//  Bob.swift
//  Port25
//
//  Created by Ieda Xavier on 18/02/25.
//

class Bob {
    var name: String = ""
    var description: String = ""
    var initialPhrase: String = ""
    var finalPhrase: String = ""
    var isThreat: Bool = false
    var bobView: BobView
    
    init(name: String, description: String, initialPhrase: String, finalPhrase: String, isThreat: Bool, bobView: BobView) {
        self.name = name
        self.description = description
        self.initialPhrase = initialPhrase
        self.finalPhrase = finalPhrase
        self.isThreat = isThreat
        self.bobView = bobView
    }
    
}

