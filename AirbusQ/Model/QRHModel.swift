//
//  QRHModel.swift
//  AirbusQ
//
//  Created by Lars Neeft on 17/02/2022.
//

import Foundation

struct QRHModel: Codable, Identifiable {
    let id: String
    let subject: String
    var memoryitems: [items]
    
    struct items: Codable, Hashable {
        let text: String
        let action: String?
    }
}
