//
//  CarDetailModel.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import SwiftUI



struct CarDetailModel: View {
    var codigo: String = ""
    var codigoModel: String = ""
    
    @State var carYear = [Anos]()

    var body: some View {
        NavigationView{
            VStack {
                Text("Ano")
                    .font(.largeTitle)
                List(carYear) { carYear in
                    let codigo1 = self.codigo
                    let codigo2 = self.codigoModel
                    let codigo3 = String(carYear.codigo)
                    
                    NavigationLink(destination: (CarDetailYear(codigo: codigo1,codigoModel: codigo2, codigoYear: codigo3))) {
                    HStack {
                        Text("\(carYear.nome)")
                        
                    }
                }
                .padding()
                }
            } .onAppear() {
                Api().loadDataCarValues(codigo: self.codigo, codigoModels: self.codigoModel) { carYear in
                    self.carYear = carYear
                }
            }
        }
    }
}

struct CarDetailModel_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailModel()
    }
}
