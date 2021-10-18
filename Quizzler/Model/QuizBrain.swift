//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Yunus Gedik on 12.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
   let quiz = [
      Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
      Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
      Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
      Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
      Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
      Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
      Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
      Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
      Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
      Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
   ]
   
   var index: Int = 0
   var correct = 0;
   var wrong = 0;
   
   mutating func checkAnswer(_ userAnswer: String)-> Bool{
      if(userAnswer == quiz[index].correctAnswer){
         correct += 1;
         return true;
      }
      wrong += 1;
      return false;
   }
   
   func getProgress()-> Float{
      return Float(index+1) / Float( quiz.count);
   }
   
   func getQuestion()-> String{
      return quiz[index].question;
   }
   
   func getCorrectCount()-> Int{
      return correct;
   }
   
   func getWrongCount()-> Int{
      return wrong;
   }
   
   func getAnswers()-> [String]{
      return quiz[index].a;
   }
   
   mutating func nextQuestion(){
      if (index + 1 == quiz.count){
         index = 0;
         correct = 0;
         wrong = 0;
      }
      else{
         index += 1
      }
   }
   
}
