//
//  ButtonLayoutView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 14/02/2022.
//

import SwiftUI

struct ButtonLayoutView: View {
    @Environment(\.colorScheme) var colorScheme
    let buttonText: String
    let buttonColor: Color
    let cornerRadius: CGFloat = 8.0
    let edgeLineWidth: CGFloat = 3

    
    var body: some View {
        ZStack {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color(UIColor.systemBackground))
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).foregroundColor(buttonColor)
                Text(buttonText)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .minimumScaleFactor(0.4)
                    
        }
    }
}

struct ButtonLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLayoutView(buttonText: "Button text.", buttonColor: Color.green)
            .padding()
            
    }
}
