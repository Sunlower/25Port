//
//  Bob.swift
//  Port25
//
//  Created by Ieda Xavier on 18/02/25.
//

class Bob {
    var name: String = ""
    var description: String = ""
    var image: String = ""
    var initialPhrase: String = ""
    var finalPhrase: String = ""
    var isThreat: Bool = false
    
    init(name: String, description: String, image: String, initialPhrase: String, finalPhrase: String, isThreat: Bool) {
        self.name = name
        self.description = description
        self.image = image
        self.initialPhrase = initialPhrase
        self.finalPhrase = finalPhrase
        self.isThreat = isThreat
    }
    
}

