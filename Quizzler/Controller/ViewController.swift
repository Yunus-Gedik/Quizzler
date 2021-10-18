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
   @IBOutlet weak var progressBar: UIProgressView!
   @IBOutlet weak var correctText: UILabel!
   @IBOutlet weak var wrongText: UILabel!
   @IBOutlet weak var firstChoice: UIButton!
   @IBOutlet weak var secondChoice: UIButton!
   @IBOutlet weak var thirdChoice: UIButton!
   
   
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
      firstChoice.backgroundColor = UIColor.clear
      secondChoice.backgroundColor = UIColor.clear
      thirdChoice.backgroundColor = UIColor.clear
      progressBar.progress = quizBrain.getProgress();
      
      questionText.text = quizBrain.getQuestion();
      
      let answers = quizBrain.getAnswers();
      
      firstChoice.setTitle(answers[0], for: .normal)
      secondChoice.setTitle(answers[1], for: .normal)
      thirdChoice.setTitle(answers[2], for: .normal)
      
      correctText.text = "Correct Answer Count: " + String(quizBrain.getCorrectCount());
      wrongText.text = "Wrong Answer Count: "  + String(quizBrain.getWrongCount());
   }
   
}

