//
//  Question.swift
//  HeadDive
//
//  Created by admin on 16 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import Foundation

class Question
{
    private var question : String?
    private var answers: [String] = [String]()
    var correctAnswerIndex : Int?
    var correctAnswerText : String?
    
    init(quesion: String, answers: [String], correctAnswerIndex : Int, correctAnswerText : String )
    {
        self.question = quesion
        self.answers  = answers
        self.correctAnswerIndex = correctAnswerIndex
        self.correctAnswerText = correctAnswerText
    }
    
    var questionText : String?
    {
        return self.question
    }
    
    func getAnswerByIndex (index : Int) -> String
    {
        return answers[index]
    }
    
    func getAnswerCount () -> Int
    {
        return answers.count
    }

}
