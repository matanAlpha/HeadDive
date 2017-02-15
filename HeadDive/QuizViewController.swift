//
//  QuizViewController.swift
//  HeadDive
//
//  Created by admin on 12 Shevat 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5
    
    var originalLayerSet  = false
    
    
    var cornerRadius: CGFloat?
    
    var borderWidth: CGFloat?
    
    var borderColor: CGColor?
    
    var bgColor: UIColor?
    
    var quiz : Quiz?
    
    var indexPaths : [IndexPath?]?//(count: 64, repeatedValue: nil)
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func middleButtonClicked(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        questionText.text = currentQuestion.questionText
        self.contentViewControler.title = getTitleText()
        indexPaths =  [IndexPath?](repeating: nil, count: myQuiz.questionCount)
//        prevButton.isHidden = true
//        nextButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    func getTitleText() -> String
    {
        let index:String = String(stringInterpolationSegment: myQuiz.currentIndex + 1)
        let count:String = String(stringInterpolationSegment: myQuiz.questionCount )
        return  index+"/"+count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentQuestion.getAnswerCount()
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
   
    @IBAction func nextButton(_ sender: AnyObject) {
        myQuiz.nextQuestion()
        updateNextPrev()
    }
    
    func updateNextPrev()
    {
        questionText.text = currentQuestion.questionText
        self.tableView.reloadData()
        self.contentViewControler.title = getTitleText()
        
    }
    
    @IBAction func prevButton(_ sender: AnyObject) {
        myQuiz.prevQuestion()
        updateNextPrev()
    }
    
    var currentQuestion : Question {
        get
        {
             return myQuiz.currentQuesion
        }
    }
    
    var myQuiz : Quiz {
        get
        {
            return (self.quiz)!
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            // note that indexPath.section is used rather than indexPath.row
            cell.textLabel?.text = currentQuestion.getAnswerByIndex(index: indexPath.section)
            // add border and color
            cell.backgroundColor = UIColor.white
        
        
            if(!originalLayerSet)
            {
                cornerRadius = cell.layer.cornerRadius
                borderWidth = cell.layer.borderWidth
                borderColor = cell.layer.borderColor
                bgColor = cell.backgroundColor
                originalLayerSet = true
            }else
            {
                restoreCell(cell:  cell)
            }
            if let answerIndex = myQuiz.getCurrentAnswerIndex()
            {
                if ( answerIndex == indexPath.section)
                {
                    highlightCell(cell: cell)
                }
            }
        
        return cell
    }
    
    func restoreCell(cell:UITableViewCell)
    {
        if (originalLayerSet)
        {
            cell.layer.borderColor = borderColor
            cell.layer.borderWidth = borderWidth!
            cell.layer.cornerRadius = cornerRadius!
            cell.backgroundColor = bgColor
        }
        cell.clipsToBounds = false
    }
    
    
    func highlightCell(cell:UITableViewCell)
    {
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.gray
        cell.clipsToBounds = true
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row

        if let tappedIndex = indexPaths![myQuiz.currentIndex] {
            let cell:UITableViewCell = tableView.cellForRow(at: tappedIndex) as UITableViewCell!
            restoreCell(cell: cell)
        }
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath) as UITableViewCell!
        highlightCell(cell: cell)

        indexPaths![myQuiz.currentIndex] = indexPath
        myQuiz.setCurrentAnswerIndex(index: indexPath.section)
        print("You tapped cell number \(indexPath.section).")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

extension UIViewController
{
    var contentViewControler: UIViewController {
        if let navCon = self as? UINavigationController {
          
            return navCon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
