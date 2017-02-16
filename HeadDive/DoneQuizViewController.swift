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
        static let ShowQuizSegue = "showQuiz"
        static let ShowPracticeSegue = "showPractice"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
    }

    
    @IBAction func doneQuiz(_ sender: UIButton) {
        var navArray:Array = (self.navigationController?.viewControllers)!
        self.navigationController?.popToViewController(navArray[0], animated: true)
        
    }
    @IBAction func backToQuiz(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
//   
//    @IBAction func showQuiz(_ sender: UIButton) {
//        performSegue(withIdentifier: StoryBorad.ShowQuizSegue, sender: sender)
//
//    }
//
//  
//    @IBAction func showPractice(_ sender: UIButton) {
//        performSegue(withIdentifier: StoryBorad.ShowPracticeSegue, sender: sender)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == StoryBorad.ShowQuizSegue {
//            if let ivc = segue.destination.contentViewControler as? QuizViewController {
//                let q = Quiz()
//                q.createDemoQuiz()
//                ivc.quiz = q
//                ivc.title = "Quiz"
//            }
//        } else if segue.identifier == StoryBorad.ShowPracticeSegue {
//            if let ivc = segue.destination.contentViewControler as? PracticeViewController {
//                let q = Quiz()
//                q.createDemoQuiz()
//                ivc.quiz = q
//                ivc.title = "Practice"
//            }
//        }
//    }

}

