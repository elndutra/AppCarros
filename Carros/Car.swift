//
//  Car.swift
//  Carros
//
//  Created by Elielton Dutra on 22/10/23.
//

import UIKit

class Car: UIViewController {
    
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var cobusLabel: UILabel!
    
    
    var value: String = ""
    var brand: String = ""
    var model: String = ""
    var year = Data()
    var cobus : String =  ""
    var codigoBrand: String = ""
    var codigoModel: Int = 0
    var codigAnos: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(codigAnos)
        loadCarValue()
        // Do any additional setup after loading the view.
    }
    
    func loadCarValue(){
        
        CarsAPI.sharedInstance.loadCarValue(Of: codigoBrand, and: codigoModel, codigoAno: codigAnos) { apiData in
            DispatchQueue.main.async {
                print(apiData.Marca)
                self.valueLabel.text = apiData.Valor
                self.brandLabel.text = apiData.Marca
                self.modelLabel.text = apiData.Modelo
                self.yearLabel.text = String(apiData.AnoModelo)
                self.cobusLabel.text = apiData.Combustivel
                
                print(self.value)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

