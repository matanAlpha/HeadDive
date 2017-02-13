//
//  Quiz.swift
//  HeadDive
//
//  Created by admin on 16 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import Foundation

class Quiz
{
    var questions : [Question] = [Question]()
    var currentQuestionIndex = 0 
    
    var currentQuesion : Question {
        return questions[currentQuestionIndex]
    }
    
    func createDemoQuiz ()
    {
        for questionsIndex in 0...5 {
            let questionText = "The question is \(questionsIndex)"
            var answers: [String] = [String]()
            var coorectAnswerText : String?
            for answerIndex in 0...3 {
                let answerText = "Answer is \(questionsIndex) and \(answerIndex)"
                answers.append(answerText)
                coorectAnswerText = "Coorect is \(questionsIndex) and \(answerIndex)"
            }
            let question = Question(quesion: questionText, answers: answers, correctAnswerIndex: 1, correctAnswerText: coorectAnswerText!)
            questions.append(question)
        }
    }
}
