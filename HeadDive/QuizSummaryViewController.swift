//
//  ViewController.swift
//  HeadDive
//
//  Created by admin on 12 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class QuizSummaryViewController: UIViewController {

    
    private struct StoryBorad
    {
        static let ShowQuizSegue = "showQuiz"
        static let ShowPracticeSegue = "showPractice"
        
    }

    @IBOutlet weak var numberOfQuestions: UILabel!
    @IBOutlet weak var numberOfCorrectAnswers: UILabel!
    
    var quiz : Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.numberOfCorrectAnswers.text = "\(quiz?.getNumberOfCorrectAnswers() ?? 0)"
        self.numberOfQuestions.text = "\(quiz?.questionCount ?? 0)"
        
    }

    
    
    @IBAction func close(_ sender: UIButton) {
        var navArray:Array = (self.navigationController?.viewControllers)!
        _ = self.navigationController?.popToViewController(navArray[0], animated: true)

    }
    

}

