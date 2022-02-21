//
//  ContentView.swift
//  AirbusQ
//
//  Created by Lars Neeft on 13/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(1..<5) { i in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("\(i)")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Airbus Questions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
