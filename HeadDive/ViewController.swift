//
//  ViewController.swift
//  HeadDive
//
//  Created by admin on 12 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private struct StoryBorad
    {
        static let EnterQuizSegue = "enterQuiz"
        static let ShowPracticeSegue = "showPractice"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
    }

        
      
    @IBAction func showQuiz(_ sender: UIButton) {
        performSegue(withIdentifier: StoryBorad.EnterQuizSegue, sender: sender)

    }

  
    @IBAction func showPractice(_ sender: UIButton) {
        performSegue(withIdentifier: StoryBorad.ShowPracticeSegue, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBorad.EnterQuizSegue {
            if let ivc = segue.destination.contentViewControler as? EnterQuizViewController {
                let q = Quiz()
                q.createDemoQuiz()
                ivc.quiz = q
                ivc.title = "Quiz"
            }
        } else if segue.identifier == StoryBorad.ShowPracticeSegue {
            if let ivc = segue.destination.contentViewControler as? PracticeViewController {
                let q = Quiz()
                q.createDemoQuiz()
                ivc.quiz = q
                ivc.title = "Practice"
            }
        }
    }

}

