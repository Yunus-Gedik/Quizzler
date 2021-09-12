//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var index: Int = 0
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initialQuiz()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if(sender.currentTitle == quiz[index].answer){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearBackground) , userInfo: nil, repeats: false)
        
        if (index + 1 == quiz.count){
            initialQuiz()
        }
        else{
            index += 1
            progressBar.progress += Float(1.0 / Float(quiz.count))
            questionText.text = quiz[index].question
        }
    }
    
    func initialQuiz(){
        index = 0;
        questionText.text = quiz[index].question
        progressBar.progress = Float(1.0 / Float(quiz.count))
    }
    
    @objc func clearBackground(){
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
    }
    
}
