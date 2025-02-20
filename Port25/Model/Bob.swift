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
    var finalPhraseOpen: String = ""
    var finalPhraseDeny: String = ""
    var isThreat: Bool = false
    var bobView: BobView
    
    init(name: String, description: String, initialPhrase: String, isThreat: Bool, bobView: BobView, phraseDeny: String, phraseOpen: String) {
        self.name = name
        self.description = description
        self.initialPhrase = initialPhrase
        self.finalPhraseOpen = phraseOpen
        self.finalPhraseDeny = phraseDeny
        self.isThreat = isThreat
        self.bobView = bobView
    }
    
}

