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
        
        let ghost = Bob(name: "ghost", description: "virus safado", image: "ghostBob", initialPhrase: "boooooo", finalPhrase: "buaaaaa", isThreat: true)
        let trojan = Bob(name: "trojan", description: "cavalo", image: "trojanBob", initialPhrase: "shiu tem ngm aqui n", finalPhrase: "vish", isThreat: true)
        let goodBob = Bob(name: "Good Bob", description: "quero café", image: "goodBob", initialPhrase: "bom dia", finalPhrase: "deus abençoe", isThreat: false)
        let spyware = Bob(name: "spyware", description: "twilight", image: "spyware", initialPhrase: "não, eu não sou espião", finalPhrase: "tem não", isThreat: true)
        
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
