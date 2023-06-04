//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by olivier geiger on 04/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

import Foundation

struct QuizBrain {
    let quiz = [
        Question(
            q: "Swift est un langage de programmation développé par Apple.",
            a: "Vrai"),
        Question(
            q: "UIKit est une framework pour le développement d'applications iOS en utilisant Swift.",
            a: "Vrai"),
        Question(
            q: "SwiftUI est une framework pour le développement d'applications iOS en utilisant Objective-C.",
            a: "Faux"),
        Question(
            q: "Swift est un langage de programmation uniquement destiné au développement d'applications iOS.",
            a: "Faux"),
        Question(
            q: "UIKit programmatique permet de créer des interfaces utilisateur en utilisant du code Swift plutôt que des fichiers de storyboard.",
            a: "Vrai"),
        Question(
            q: "SwiftUI est basé sur une approche déclarative pour la création d'interfaces utilisateur.",
            a: "Faux"),
        Question(
            q: "Swift est un langage orienté objet.",
            a: "Vrai"),
        Question(
            q: "L'architecture MVC (Model-View-Controller) est couramment utilisée avec UIKit pour structurer les applications iOS.",
            a: "Vrai"),
        Question(
            q: "SwiftUI prend en charge le développement d'applications pour macOS, iOS, watchOS et tvOS.",
            a: "Vrai"),
        Question(
            q: "On ne peut pas utiliser UIKit et SwiftUI ensemble dans une même application.",
            a: "Faux"),
        Question(
            q: "UIKit fournit des contrôles d'interface utilisateur prêts à l'emploi tels que des boutons, des étiquettes et des vues de tableau.",
            a: "Vrai"),
        Question(
            q: "SwiftUI utilise des 'State Objects' pour gérer l'état des vues.",
            a: "Vrai"),
        Question(
            q: "L'interface utilisateur dans UIKit est construite en utilisant une hiérarchie de vues.",
            a: "Vrai"),
        Question(
            q: "SwiftUI est introduit dans iOS 13.",
            a: "Vrai"),
        Question(
            q: "On ne peut pas créer des interfaces utilisateur réactives dans UIKit.",
            a: "Faux"),
        Question(
            q: "Les propriétés observables sont utilisées dans SwiftUI pour détecter les changements d'état.",
            a: "Vrai"),
        Question(
            q: "Swift est un langage statiquement typé, ce qui signifie que les types doivent être déclarés explicitement.",
            a: "Faux"),
        Question(
            q: "On ne peut pas utiliser UIKit et SwiftUI dans le même projet Xcode.",
            a: "Faux"),
        Question(
            q: "Les animations sont plus faciles à réaliser dans SwiftUI par rapport à UIKit.",
            a: "Vrai"),
        Question(
            q: "Le développement d'interfaces utilisateur avec UIKit programmatique est généralement considéré comme plus verbeux que l'utilisation de SwiftUI.",
            a: "Vrai"),
    ]
    
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
           return false
        }
    }
    
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }

    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {            return true
        } else {
            return false
        }
    }

}
