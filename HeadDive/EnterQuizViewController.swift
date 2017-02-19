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
        wrongCodeText.isHidden = true
        
        
        
    }

    @IBOutlet weak var wrongCodeText: UILabel!
    @IBOutlet weak var enteredCodeText: UITextField!
    
    
    @IBAction func startQuiz(_ sender: UIButton) {
        
        if let enteredExamineeCode = enteredCodeText.text {
            if(quiz!.checkExamineeCode(enteredCode: enteredExamineeCode))
            {
                performSegue(withIdentifier: StoryBorad.ShowQuizSegue, sender: sender)
                wrongCodeText.isHidden = true

            }else {
                wrongCodeText.isHidden = false
            }
        }else
        {
            wrongCodeText.isHidden = false
        }
    

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

