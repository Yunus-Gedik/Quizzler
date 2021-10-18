//
//  Question.swift
//  Quizzler
//
//  Created by Yunus Gedik on 12.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
   let question: String
   let a: [String]
   let correctAnswer: String
   
   init(q: String, a: [String], correctAnswer: String){
      self.question = q;
      self.a = a;
      self.correctAnswer = correctAnswer;
   }
}
