//
//  ContentView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 13/02/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        ForEach(1..<15) { i in
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Text("\(i)")
                                
                                    
                            }
                            .listRowBackground(opacity(0.5))
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
