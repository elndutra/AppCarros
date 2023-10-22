//
//  ContentView.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var cars = [Car]()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Marcas")
                    .font(.largeTitle)
                List(cars) { car in
                    NavigationLink(destination: (CarDetails(codigo:  car.codigo))) {
                    HStack {
                        Text("\(car.nome)")
                    }
                }
                .padding()
                }
            } .onAppear() {
                Api().loadData { car in
                    self.cars = car
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
