//
//  QuestionView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 17/02/2022.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 1).fill(colorScheme == .dark ? .white : .black).opacity(0.2)
                    RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 1)
                    Text("In what mode(s) can the RNAV position information be displayed on the ND?")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                        .minimumScaleFactor(0.4)
                        
            }
            
    
            ForEach(1..<5) { i in
                ButtonLayoutView(buttonText: "DMC 1 displays its information on the: upper ECAM, ND1 and PFD 1 DMC 2 displays its information on the lower ECAM, ND 2 and PFD 2", buttonColor: .green)
            }
            BottomLabelView()
        }
        .padding(10)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionView()
                .preferredColorScheme(.light)
            
            QuestionView()
                .preferredColorScheme(.dark)
        }
    }
}


