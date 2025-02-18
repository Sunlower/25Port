//
//  GameplayManager.swift
//  Port25
//
//  Created by Ieda Xavier on 18/02/25.
//

class GameplayManager {
    
    static var shared = GameplayManager()
    
    var bobs: [Bob]
    
    var currentLevel: Int
    
    var score: Int = 0
    
    private init() {
        
        let ghost = Bob(name: "ghost", description: "virus safado", initialPhrase: "boooooo", finalPhrase: "buaaaaa", isThreat: true, bobView: BobView(name: "ghostBob"))
            
        let trojan = Bob(name: "trojan", description: "cavalo", initialPhrase: "shiu tem ngm aqui n", finalPhrase: "vish", isThreat: true, bobView: BobView(name: "trojanBob"))
        let goodBob = Bob(name: "Good Bob", description: "quero café", initialPhrase: "bom dia", finalPhrase: "deus abençoe", isThreat: false, bobView: BobView(name: "goodBob"))
        let spyware = Bob(name: "spyware", description: "twilight", initialPhrase: "não, eu não sou espião", finalPhrase: "tem não", isThreat: true, bobView: BobView(name: "spywareBob"))
        
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
