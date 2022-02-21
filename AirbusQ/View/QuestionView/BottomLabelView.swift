//
//  BottomLabelView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 17/02/2022.
//

import SwiftUI

struct BottomLabelView: View {
    var body: some View {
        HStack {
            Text("1 / 50")
            
            Spacer()
            
            Image(systemName: "info.circle")
            
            Spacer()
            
            Image(systemName: "envelope.fill")
                .font(.title3)
            Spacer()
            
            Text("100%")
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .border(Color.gray)
    }
}

struct BottomLabelView_Previews: PreviewProvider {
    static var previews: some View {
        BottomLabelView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
