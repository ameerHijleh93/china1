//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
   //Place your instance variables here
    let allQuistion = quistionBanke()
    var quistionNumbeer : Int = 0
    var pikAnswer : Bool = false
    var scrol :Int = 0
   // let answer = firstQuistion.answer
    @IBOutlet weak var wid: NSLayoutConstraint!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let firstQuistion = allQuistion.list[0]
//        questionLabel.text = firstQuistion.quistionText
        nextQuestion()
    }
 @IBAction func answerPressed(_ sender: AnyObject) {
     wid.constant = wid.constant + self.view.frame.size.width * (1/13)
        if sender.tag == 1 {
            pikAnswer = true
        }
        else if sender.tag == 2 {
            pikAnswer = false
        }
        checkAnswer()
         quistionNumbeer = quistionNumbeer + 1
        nextQuestion()
    }
   
    
   func updateUI() {
        scoreLabel.text = "Score: \(scrol) from \(quistionNumbeer) quistion"
        progressLabel.text = "\(quistionNumbeer + 1)/13"
       // progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(quistionNumbeer + 1)
    progressBar.frame.size.width = (view.frame.size.width / 13 ) * CGFloat(quistionNumbeer)
    }
    
    func nextQuestion() {
        if quistionNumbeer <= 12 {
          questionLabel.text = allQuistion.list[quistionNumbeer].quistionText
             updateUI()
        }
        else{
            print("the quistion is end")
           // updateUI()
          //  quistionNumbeer = 0
            let alert = UIAlertController(title: "awesome", message: "you finish this test you wont to re try ??", preferredStyle: .alert)
            let resetAction = UIAlertAction(title: "reset", style: .destructive, handler: {(UIAlertAction) in self.startOver() })
            alert.addAction(resetAction)
            present(alert,animated: true,completion: nil)
           // scrol = 0
       }
    }
    
    func checkAnswer() {
        let corectAnsur = allQuistion.list[quistionNumbeer].answer
        if corectAnsur == pikAnswer {
           // print("You Got IT!")
            ProgressHUD.showSuccess("You Got IT!")
            scrol = scrol + 1
        }
        else{
             ProgressHUD.showError("whring")
          //  print ("whring")
            // scrol = scrol + 1
        }
    }
    
    func startOver() {
        scrol = 0
       quistionNumbeer = 0
        nextQuestion()
        wid.constant = self.view.frame.size.width * (1/13)
   }
}
