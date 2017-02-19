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
    private var questions : [Question] = [Question]()
    private var answersIndices : [Int?] = [Int?]()
    private var currentQuestionIndex = 0
    
    private var examineeCode : String?
    
    var currentQuesion : Question {
        return questions[currentQuestionIndex]
    }
    
    func nextQuestion()
    {
        if(!isLastQuestion)
        {
            currentQuestionIndex += 1
        }
    }

    func setCurrentAnswerIndex( index : Int)
    {
        answersIndices[currentQuestionIndex] = index
    }

    func getCurrentAnswerIndex() -> Int?
    {
        return  answersIndices[currentQuestionIndex]
    }

    
    var currentIndex : Int
    {
        get{
          return currentQuestionIndex
        }
    }

    var questionCount : Int
        {
        get{
            return questions.count
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
            return (questions.count-1) == currentQuestionIndex
        }
    }
    
    var isFirstQuestion : Bool {
        get
        {
            return currentQuestionIndex == 0
        }
    }
    
    func getNumberOfCorrectAnswers() -> Int
    {
        var ret = 0
        for qustionIndex in 0...questions.count-1
        {
            if let asnwerIndex = answersIndices[qustionIndex] {
                if (questions[qustionIndex].isCorrectAnswer(answerIndex: asnwerIndex))
                {
                    ret += 1
                }
            }
        }
        
        return ret
    }
    
    func checkExamineeCode(enteredCode : String) -> Bool
    {
        var ret = false
        
            if (enteredCode == examineeCode!)
            {
                ret = true
            }
        return ret
    }
    
    func createDemoQuiz ()
    {
        for questionsIndex in 0...1 {
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
            answersIndices.append(nil)
        }
        examineeCode = "abc"
    }
}
