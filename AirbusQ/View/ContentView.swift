//
//  ContentView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 13/02/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    let limits: [QuestionModel] = Bundle.main.decode("Limitations.json")
    @StateObject var questionVM = QuestionViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        Section(header: Text("Subjects:")) {
                        
                            ForEach(1..<10) { i in
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    Text("\(i)")
                                }
                                .listRowBackground(opacity(0.5))
                            }
                        }
                        
                        Section(header: Text("Limitations")) {
                            ForEach(limits) { limit in
                                NavigationLink(destination: QuestionView(questions: limit)) {
                                    Text("limit")
                                }
                            }
                            
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
                .navigationTitle("Airbus Questions")
                .navigationBarTitleDisplayMode(.inline)
            }.background( LinearGradient(gradient: Gradient(colors: [.blue, .white, .brown]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                    .preferredColorScheme(.light)
                
            ContentView()
                    .preferredColorScheme(.dark)
        }
    }
}
