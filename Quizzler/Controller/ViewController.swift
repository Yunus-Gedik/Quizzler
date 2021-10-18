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
   @IBOutlet weak var correctText: UILabel!
   @IBOutlet weak var wrongText: UILabel!

   var quizBrain = QuizBrain();
   
   override func viewDidLoad() {
      super.viewDidLoad()
      updateGUI();
   }
   
   @IBAction func buttonPressed(_ sender: UIButton) {
      
      if(quizBrain.checkAnswer(sender.currentTitle!)){
         sender.backgroundColor = UIColor.green
      }
      else{
         sender.backgroundColor = UIColor.red
      }
      
      Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateGUI) , userInfo: nil, repeats: false)
      
      quizBrain.nextQuestion();
      
   }
   
   @objc func updateGUI(){
      falseButton.backgroundColor = UIColor.clear
      trueButton.backgroundColor = UIColor.clear
      progressBar.progress = quizBrain.getProgress();
      questionText.text = quizBrain.getQuestion();
      correctText.text = "Correct Answer Count: " + String(quizBrain.getCorrectCount());
      wrongText.text = "Wrong Answer Count: "  + String(quizBrain.getWrongCount());
   }
   
}

