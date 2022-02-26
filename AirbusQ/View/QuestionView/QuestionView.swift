//
//  QuestionView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 17/02/2022.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var answerPressed = false
    @State private var buttonPressed = 0
    @StateObject var questionVM = QuestionViewModel()
    let questions: QuestionModel
    var body: some View {
        VStack {
            if (0 < questions.questions.count) {
            ZStack {
                RoundedRectangle(cornerRadius: 1).fill(colorScheme == .dark ? .white : .black).opacity(0.2)
                    RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 1)
                    Text(questions.questions[questionVM.questionNumber].questionText)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                        .minimumScaleFactor(0.4)
                        
            }
            
    
                ForEach(0..<4) { question in
                    Button(action: {
                        buttonPressed(pressed: question)
                        answerPressed.toggle()
                    }) {
                        correctButton(question: question)
                    }
                }
            BottomLabelView()
            } else {
                EmptyView()
            }
        }
        .padding(10)
    }
    
    @ViewBuilder
    func correctButton(question: Int) -> some View {
        if question == 0 {
            ButtonLayoutView(buttonText: questions.questions[questionVM.questionNumber].answerA, buttonColor: questionVM.colorButtonA)
                .minimumScaleFactor(0.4)
        } else if question == 1 {
            ButtonLayoutView(buttonText: questions.questions[questionVM.questionNumber].answerB, buttonColor: questionVM.colorButtonB)
                .minimumScaleFactor(0.4)
        } else if question == 2 {
            ButtonLayoutView(buttonText: questions.questions[questionVM.questionNumber].answerC, buttonColor: questionVM.colorButtonC)
                .minimumScaleFactor(0.4)
        }
        else if question == 3 {
            ButtonLayoutView(buttonText: questions.questions[questionVM.questionNumber].answerD, buttonColor: questionVM.colorButtonD)
                .minimumScaleFactor(0.4)
        }
    }
    
    func buttonPressed(pressed: Int) {
        buttonPressed += 1
        if buttonPressed == 1 {
            questionVM.checkAnswer(answerPressed: pressed + 1, correctAnswer: questions.questions[questionVM.questionNumber].correctAnswer)
            buttonPressed = 0
        }
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionView( questions: QuestionModel(id: "A", subject: "S", questions: [QuestionModel.questionArray.init(questionText: "QuestionText",answerA: "AnswerA", answerB: "answerB", answerC: "AnswerC", answerD: "answerD", correctAnswer: 1, fcom: "fcom")]))
                .preferredColorScheme(.light)
            
            QuestionView( questions: QuestionModel(id: "A", subject: "S", questions: [QuestionModel.questionArray.init(questionText: "QuestionText",answerA: "AnswerA", answerB: "answerB", answerC: "AnswerC", answerD: "answerD", correctAnswer: 1, fcom: "fcom")]))
                .preferredColorScheme(.dark)
        }
    }
}


