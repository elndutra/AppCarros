//
//  CarsAPI.swift
//  Carros
//
//  Created by Elielton Dutra on 21/10/23.
//

import Foundation
import Alamofire

class CarsAPI {
    static let sharedInstance = CarsAPI()
    
    static private let basePath = "https://parallelum.com.br/fipe/api/v1/carros/"
    static private let marcas = "marcas"
    static private let modelos = "modelos"
    static private let anos = "anos"
   


    
    func loadCars(load: @escaping (_ apiData: [Brand]) -> (Void))  {
        let url = CarsAPI.basePath + CarsAPI.marcas
          
        AF
            .request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil )
            .response{ resp in
                switch resp.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode([Brand].self, from: data!)
                        load(jsonData)
                        for j in jsonData {
                            print(j.nome)
                        }
                    }catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
    }
    
    func loadCarsModels (Of codigo: String, loadCarModel: @escaping (_ apiData: Models) -> (Void))  {
        let url = CarsAPI.basePath + CarsAPI.marcas + "/\(codigo)/" + CarsAPI.modelos
          print(url)
        AF
            .request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil )
            .response{ resp in
                switch resp.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(Models.self, from: data!)
                        loadCarModel(jsonData)
                   
                    }catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
    }
    
    func loadCarsYear (Of codigoBrand: String, and codidgoModel: Int, loadCarModelYear: @escaping (_ apiData: [Anos]) -> (Void))  {
        let url = CarsAPI.basePath + CarsAPI.marcas + "/\(codigoBrand)/" + CarsAPI.modelos + "/\(codidgoModel)/" + CarsAPI.anos
          print(url)
        AF
            .request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil )
            .response{ resp in
                switch resp.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode([Anos].self, from: data!)
                        loadCarModelYear(jsonData)
                   
                    }catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
    }
    
    func loadCarValue (Of codigoBrand: String, and codidgoModel: Int,codigoAno: String, loadCarModelYear: @escaping (_ apiData: CarValue) -> (Void))  {
        let url = CarsAPI.basePath + CarsAPI.marcas + "/\(codigoBrand)/" + CarsAPI.modelos + "/\(codidgoModel)/" + CarsAPI.anos + "/\(codigoAno)"
          print(url)
        AF
            .request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil )
            .response{ resp in
                switch resp.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(CarValue.self, from: data!)
                        loadCarModelYear(jsonData)
                   
                    }catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
            
    }
    
    
}



struct Brand: Codable {
    let codigo: String
    let nome: String
    
    enum CodingKeys: String, CodingKey {
        case codigo
        case nome
    }
}

struct Models: Codable {
    
    let anos: [Anos]
    let modelos: [Modelos]

    enum CodingKeys: CodingKey {
        case anos
        case modelos

    }
}

struct Anos: Codable {
    let codigo: String
    let nome: String
    
    enum CodingKeys: CodingKey {
        case codigo
        case nome
    }
}

struct Modelos: Codable {
    let codigo: Int
    let nome: String
    enum CodingKeys: CodingKey {
        case codigo
        case nome
    }
}

struct CarValue: Codable {
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
    
    enum TypeAPIURL: String {
        case marcas
        case modelos
        case anos
        }

    
