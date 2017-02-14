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
    private var currentQuestionIndex = 0
    private var isLast = false
    
    var currentQuesion : Question {
        return questions[currentQuestionIndex]
    }
    
    func nextQuestion()
    {
        if(!isLast)
        {
            currentQuestionIndex += 1
            if((questions.count-1) == currentQuestionIndex)
            {
                isLast = true
            }
        }
    }

    func prevQuestion()
    {
        if(currentQuestionIndex > 0)
        {
            currentQuestionIndex -= 1
        }
    }

    var isLastQuestion : Bool {
        
        get
        {
            return isLast
        }
    }
    
    var isFirstQuestion : Bool {
        get
        {
            return currentQuestionIndex == 0
        }
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
