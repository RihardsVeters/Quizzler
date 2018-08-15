//
//  Question.swift
//  Quizzler
//
//  Created by Rihards Veters on 06/08/2018.
//  Copyright © 2018 Rihards Veters. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
