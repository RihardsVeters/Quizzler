//
//  ViewController.swift
//  Quizzler
//
//  Created by Rihards Veters on 06/08/2018.
//  Copyright (c) 2018 Rihards Veters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var allQuestionCount : Int = 0
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allQuestionCount = self.allQuestions.list.count
        print(allQuestionCount)
        nextQuestion()
        
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestionCount)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestionCount)) * CGFloat(questionNumber +  1)
    }
    
    func nextQuestion() {
        if questionNumber <= allQuestionCount-1 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            //Alert
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil )
            
        }
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }else{
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    
}
