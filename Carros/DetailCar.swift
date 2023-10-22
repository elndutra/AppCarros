//
//  DetailCar.swift
//  Carros
//
//  Created by Elielton Dutra on 21/10/23.
//

import UIKit

class DetailCar: UIViewController {
//    var brand: [Brand]?
    var models: Models?
    var cod: String = ""
    
    
    @IBOutlet var detailCarsLabel: UILabel!
    @IBOutlet var apiDetailModel: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.detailCarsLabel.text = "Modelo"
        loadModel()
        
        
    }
    
    func loadModel(){
        
        
        
        CarsAPI.sharedInstance.loadCarsModels(Of: cod) { apiData in
            self.models = apiData
            DispatchQueue.main.async {
                
                self.apiDetailModel.reloadData()
                for item in self.models?.modelos ?? [Modelos]() {
                    
                    print(item.nome)
                }
                
            }
        }
        
    }
    
}

extension DetailCar: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.modelos.count ?? 0
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetails")
        else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = models?.modelos[indexPath.row].nome
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetailYear", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? YearCar {
            destination.codigoModel = (models?.modelos[(apiDetailModel.indexPathForSelectedRow?.row)!].codigo)! 
            destination.codigoBrand = cod
//          apiDataView.deselectRow(at: [apiDataView.indexPathsForSelectedRows], animated: true)
            
        }
    }
}
