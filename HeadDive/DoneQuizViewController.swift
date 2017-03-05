//
//  ViewController.swift
//  HeadDive
//
//  Created by admin on 12 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class DoneQuizViewController: UIViewController {

    
    private struct StoryBorad
    {
        static let ShowQuizSummary = "showQuizSummary"
        
    }
    
    var quiz : Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBorad.ShowQuizSummary {
            if let ivc = segue.destination.contentViewControler as? QuizSummaryViewController {
                ivc.quiz = self.quiz
            }
        }
    }
    
    
    @IBAction func doneQuiz(_ sender: UIButton) {
        performSegue(withIdentifier: StoryBorad.ShowQuizSummary, sender: sender)

    }
    @IBAction func backToQuiz(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

