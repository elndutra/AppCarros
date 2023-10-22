//
//  Cars.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import Foundation

struct Car: Codable, Identifiable {
    let id = UUID()
    let codigo: String
    let nome: String

}

class Api : ObservableObject{
    @Published var car = [Car]()

    
    func loadData(completion:@escaping ([Car]) -> ()) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let car = try! JSONDecoder().decode([Car].self, from: data!)
            print(car)
            DispatchQueue.main.async {
                completion(car)
            }
        }.resume()
        
    }
    
    func loadDataModel(codigo: String,completion:@escaping (Models) -> ()) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codigo)/modelos") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let carModel = try! JSONDecoder().decode(Models.self, from: data!)
            print(carModel)
            DispatchQueue.main.async {
                completion(carModel)
            }
        }.resume()
        
    }
    
    func loadDataCarValues (codigo: String,codigoModels: String,completion:@escaping ([Anos]) -> ()) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codigo)/modelos/\(codigoModels)/anos") else {
            print("Invalid url...")
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            let carAnos = try! JSONDecoder().decode([Anos].self, from: data!)
            print(carAnos)
            DispatchQueue.main.async {
                completion(carAnos)
            }
        }.resume()
        
    }
    
    func loadDataCarDetailsValus(codigo: String,codigoModels: String,codigoValues: String,completion:@escaping (CarValue) -> ()){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(codigo)/modelos/\(codigoModels)/anos/\(codigoValues)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let carValues = try! JSONDecoder().decode(CarValue.self, from: data!)
            print(carValues)
            DispatchQueue.main.async {
                completion(carValues)
            }
        }.resume()
    }
}

struct Models: Codable, Identifiable {
    let id = UUID()
    let anos: [Anos]
    let modelos: [Modelos]

    enum CodingKeys: CodingKey {
        case anos
        case modelos

    }
}

struct Anos: Codable, Identifiable {
    let id = UUID()
    let codigo: String
    let nome: String
    
    enum CodingKeys: CodingKey {
        case codigo
        case nome
    }
}

struct Modelos: Codable, Identifiable {
    let id = UUID()
    let codigo: Int
    let nome: String
    enum CodingKeys: CodingKey {
        case codigo
        case nome
    }
}



struct CarValue: Codable, Identifiable {
    let id = UUID()
    let Valor: String
    let Marca: String
    let Modelo: String
    let AnoModelo: Int
    let Combustivel: String
    let CodigoFipe: String
    let MesReferencia: String
    let SiglaCombustivel: String
    
    enum CodingKeys: CodingKey {
        case Valor
        case Marca
        case Modelo
        case AnoModelo
        case Combustivel
        case CodigoFipe
        case MesReferencia
        case SiglaCombustivel
    }
    
}
    
  
