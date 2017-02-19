//
//  ViewController.swift
//  HeadDive
//
//  Created by admin on 12 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class EnterQuizViewController: UIViewController {

    var quiz : Quiz?
    
    private struct StoryBorad
    {
        static let ShowQuizSegue = "showQuiz"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
    }

    
    @IBAction func startQuiz(_ sender: UIButton) {
        performSegue(withIdentifier: StoryBorad.ShowQuizSegue, sender: sender)
    }
   


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBorad.ShowQuizSegue {
            if let ivc = segue.destination.contentViewControler as? QuizViewController {
                ivc.quiz = quiz
                ivc.title = "Quiz"
            }
        }
    }

}

