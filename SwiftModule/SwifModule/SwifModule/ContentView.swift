//
//  ContentView.swift
//  SwifModule
//
//  Created by Elielton Dutra on 22/10/23.
//

import SwiftUI
import Core

struct ContentView: View {
    
    var person = Person(name: "Elielton",lastName: "Dutra")

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
    
            Text(person.getFullName())
        
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
