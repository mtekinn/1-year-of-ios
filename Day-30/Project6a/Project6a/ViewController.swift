//
//  ViewController.swift
//  Project6a
//
//  Created by Mehmet Tekin on 30.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionCounter = 0
    var wrongAnswerCounter = 0
    var trueAnswerCounter = 0
    var isGameContinue = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showPoint))

        
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        let scoreView = UILabel()
        scoreView.text = "Score: \(score)"
        let scoreButton = UIBarButtonItem(customView: scoreView)
        navigationItem.rightBarButtonItem = scoreButton
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        questionCounter += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            trueAnswerCounter += 1
        } else {
            title = "Wrong"
            score -= 1
            wrongAnswerCounter += 1
            let alertForWrongMsg = UIAlertController(title: title, message: "Wrong! That’s the flag of \(countries[sender.tag])", preferredStyle: .alert)
            alertForWrongMsg.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: askQuestion))
            self.present(alertForWrongMsg, animated: true)
        }
        
        if questionCounter == 10 {
            let tenQuestionAlert = UIAlertController(title: title, message: "Your answered \(questionCounter) questions. You have \(trueAnswerCounter) true answer and \(wrongAnswerCounter) wrong answer.", preferredStyle: .alert)
            tenQuestionAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

            present(tenQuestionAlert, animated: true)
            questionCounter = 0
            trueAnswerCounter = 0
            wrongAnswerCounter = 0
            score = 0
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
    @objc func showPoint() {
        let message = "Score is \(score)"
        
        let vc = UIAlertController(title: "Score", message: message, preferredStyle: .alert)
          vc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
          present(vc,animated: true)
    }
}


