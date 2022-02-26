//
//  QuestionModel.swift
//  AirbusQ
//
//  Created by Lars Neeft on 17/02/2022.
//

import Foundation

struct QuestionModel: Codable, Identifiable {
    let id: String
    let subject: String
    let questions: [questionArray]
    
    
    struct questionArray: Codable, Hashable {
        let questionText: String
        let answerA: String
        let answerB: String
        let answerC: String
        let answerD: String
        var correctAnswer: Int
        let fcom: String?
    }
    
   
}
