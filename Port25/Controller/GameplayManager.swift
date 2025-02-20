//
//  GameplayManager.swift
//  Port25
//
//  Created by Ieda Xavier on 18/02/25.
//

import SwiftUI

class GameplayManager: ObservableObject {
    
    static var shared = GameplayManager()
    
    var bobs: [Bob]
    
    @Published var currentLevel: Int
    
    @Published var score: Int = 0
    
    private init() {
        
        let ghost = Bob(name: "ghost", description: "The man-in-the-middle (MitM) attack is a criminal method of intercepting communication between two hosts and, consequently, stealing information. The structure of the attack is basic but functional.", initialPhrase: "boooooo", isThreat: true, bobView: BobView(name: "ghostBox"), phraseDeny: "buaaaaa", phraseOpen: "buahahahahaa")
        
        let trojan = Bob(name: "trojan", description: "A Trojan is malicious software capable of disguising itself as common programs to infect a device. This type of malware is widely used by cybercriminals, hackers, or security institutions to discreetly infiltrate computers.", initialPhrase: "shiu tem ngm aqui n", isThreat: true, bobView: BobView(name: "trojanBox"), phraseDeny: "It seems I was blocked... but don’t worry, I’ll be back.", phraseOpen: "MUDAR DEPOIS")
    
                         
        let goodBob = Bob(name: "goodBob", description: "quero café", initialPhrase:  "Hello, my friend, I believe everything is ready for me to proceed.", isThreat: false, bobView: BobView(name: "bobBox"), phraseDeny: "deus abençoe", phraseOpen: "amem")
       
        let spyware = Bob(name: "spyware", description: "Spyware installs itself on a device without providing adequate warning or without the person's consent. Once installed, it can monitor online behavior, collect sensitive information, alter device settings, and reduce device performance.", initialPhrase: "não, eu não sou espião", isThreat: true, bobView: BobView(name: "spyWareBox"), phraseDeny: "blz", phraseOpen: "blz")
        
        
        bobs = [ghost, trojan, goodBob, spyware]
        currentLevel = 0
    }
    
    // quando o usuario clicar no botão de permitir ou negar entrada é pra chamar essa função aqui
    func validateChoice(didAllowEntrance: Bool) {
        if (bobs[currentLevel].isThreat && !didAllowEntrance) || (!bobs[currentLevel].isThreat && didAllowEntrance) {
                score += 1
        }
    }
    
    func nextLevel() {
        currentLevel += 1
    }
}
