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
        static let ShowQuizSegue = "showQuiz"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
    }

    
   
    @IBAction func showQuiz(_ sender: UIButton) {
        performSegue(withIdentifier: StoryBorad.ShowQuizSegue, sender: sender)

    }

  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBorad.ShowQuizSegue {
            if let ivc = segue.destination.contentViewControler as? QuizViewController {
//                let imageName = (sender as? UIButton)?.currentTitle
//                ivc.imageURL = DemoURL.NASAImageNamed(imageName: imageName)
                
                ivc.title = "Backy"
            }
        }
    }

}

