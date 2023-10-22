//
//  CarDetailYear.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import SwiftUI

struct CarDetailYear: View {
    var codigo: String = ""
    var codigoModel: String = ""
    var codigoYear: String = ""
    @State var carValue: CarValue?
    
    var body: some View {

            HStack(alignment: .center, spacing: 16){
                Button {
                    print("Ola")
                } label: {
                    Text("Marcas")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    
                }
                
                Button {
                    print("Ola")
                } label: {
                    Text("Valor")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    
                }
                Button {
                    print("Ola")
                } label: {
                    Text("Modelos")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    
                }
                Button {
                    print("Ola")
                } label: {
                    Text("Ano")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                    
                }
            }
        
   
            HStack (alignment: .center, spacing: 3){
                let marca = carValue?.Marca ?? ""
                Text("\(marca)")
                    .padding(.trailing,3)
                
                let value = carValue?.Valor ?? ""
                Text("\(value)")
                    .padding(.trailing,3)
                
                
                let modelo = carValue?.Modelo ?? ""
                Text("\(modelo)")
                    .padding(.trailing,3)
                
                let anoModelo = carValue?.AnoModelo ?? 0
                Text("\(anoModelo)")
                    .padding(.trailing,3)
            }.onAppear(){
            Api().loadDataCarDetailsValus(codigo: self.codigo, codigoModels: self.codigoModel, codigoValues: self.codigoYear) { values in
                self.carValue = values
            }
        }
    }
}

struct CarDetailYear_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailYear()
    }
}
