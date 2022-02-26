//
//  DisclaimerView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 13/02/2022.
//

import SwiftUI

struct DisclaimerView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("disclaimer") var disclaimer: Bool = false
    @State var savedValue = true
  
    
    var body: some View {
        VStack{
            
            //Logo to go
            VStack(alignment: .leading, spacing: 15) {
                Text("""
                     A320 Quiz, is meant to be used for training and trainig only. The app cannot and shall not be used as a reference for technical or any other matters related to the Airbus. for reference use the applicable official Airbus documentation.
                     
                     The material in this app may inlcude inaccuracies or other errors. Use the app entirely at your own risk.
                     
                     The owners of this app, nor any involved in creating, producing or delivering the app shall be liable for any direct, incidental, indirect or punitive damages or problems arising of your access to,or use of, the app.
                     """)
                
                Text("- Press the  \(Image(systemName:"envelope.fill")) to send us an email.")
                Text("- Press the \(Image(systemName: "info.circle")) to find the answer in the fcom.")
            }
            Spacer()
            Button {
                disclaimer = savedValue
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("I agree")
            }

        }
        .padding()
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
