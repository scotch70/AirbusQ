//
//  QuestionViewModel.swift
//  AirbusQ
//
//  Created by Lars Neeft on 18/02/2022.
//

import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var questionNumber = 0
    @Published var scoreCounter = 0
    @Published var scoreValue: Double = 0.0
    @Published var colorButtonA = Color.gray
    @Published var colorButtonB = Color.gray
    @Published var colorButtonC = Color.gray
    @Published var colorButtonD = Color.gray

 

    //MARK: - Intent(s)
    
    func scoreNumber() -> Int {
        var scoreNumber = 0
        scoreNumber = questionNumber + 1
        return scoreNumber
    }
    
    func restartQuiz() {
        //reset the Quiz counter and score to 0
        self.scoreCounter = 0
        self.questionNumber = 0
        self.scoreValue = 0.0
    }
    
    func resetQID() {
        colorButtonA = .gray
        colorButtonB = .gray
        colorButtonC = .gray
        colorButtonD = .gray

    }
    
    func updateQuestionumber()  {
        self.questionNumber += 1
        self.score()
        self.resetQID()
    }
    
    var scoreTracker: Double = 0.0 {
        didSet {
            //Future score
            if scoreCounter == 0 || questionNumber == 0 {
                scoreTracker = oldValue
                scoreTracker = 0.0
            } else if scoreCounter == 0 && questionNumber == 1 {
                scoreTracker = 0.0
            } else {
                let val = scoreCounter * 100
                scoreTracker = Double(val) / Double(questionNumber)
            }
        }
        
    }
   
    func previousQuestionNumber() {
        if questionNumber > 0 {
            self.questionNumber -= 1
        }
    }
    
    func checkAnswer(answerPressed: Int, correctAnswer: Int) {
        if answerPressed == 1 && answerPressed == correctAnswer {
            scoreCounter += 1
            colorButtonA = .green
        } else if answerPressed == 1 && answerPressed != correctAnswer {
            colorButtonA = .red
            showCorrectAnswer(correctAnswer: correctAnswer)
        }else if answerPressed == 2 && answerPressed == correctAnswer {
            scoreCounter += 1
            colorButtonB = .green
        } else if answerPressed == 2 && answerPressed != correctAnswer {
            colorButtonB = .red
            showCorrectAnswer(correctAnswer: correctAnswer)
        }else if answerPressed == 3 && answerPressed == correctAnswer {
            scoreCounter += 1
            colorButtonC = .green
        } else if answerPressed == 3 && answerPressed != correctAnswer {
            colorButtonC = .red
            showCorrectAnswer(correctAnswer: correctAnswer)
        } else if answerPressed == 4 && answerPressed == correctAnswer {
            scoreCounter += 1
            colorButtonD = .green
        } else if answerPressed == 4 && answerPressed != correctAnswer {
            colorButtonD = .red
            showCorrectAnswer(correctAnswer: correctAnswer)
        }
    }
    
    func showCorrectAnswer(correctAnswer: Int) {
        if correctAnswer == 1 {
            colorButtonA = .green
        } else if correctAnswer == 2 {
            colorButtonB = .green
        } else if correctAnswer == 3 {
            colorButtonC = .green
        }
        else if correctAnswer == 4 {
            colorButtonD = .green
        }
    }
    
    func score() {
        // total questions answered / the correct questions answered * 100
        if scoreCounter == 0 || questionNumber == 0 {
            scoreValue = 0.0
        } else if scoreCounter == 0 && questionNumber == 1 {
            scoreValue = 0.0
        } else {
            let val = scoreCounter * 100
            scoreValue = Double(val) / Double(questionNumber)
        }
    }
}
