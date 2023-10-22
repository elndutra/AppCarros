//
//  CarDetails.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import SwiftUI

struct CarDetails: View {
    
    var codigo: String = ""
    @State var carModel: Models?
    
    var body: some View {
//        Text("O códgio é \(codigo) ")
        
        NavigationView{
            VStack {
                Text("Modelos")
                    .font(.largeTitle)
                List(carModel?.modelos ?? [Modelos]()) { carModel in
                    
                    let codigo1 = String(self.codigo)
                    let codigo2 = String(carModel.codigo)
                    NavigationLink(destination: (CarDetailModel(codigo: codigo1,codigoModel: codigo2))) {
                    HStack {
                        Text("\(carModel.nome)")
                        
                    }
                }
                .padding()
                }
            } .onAppear() {
                Api().loadDataModel(codigo: self.codigo) { carModel in
                    self.carModel = carModel
                }
            }
        }
    }
}

struct CarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CarDetails()
    }
}
