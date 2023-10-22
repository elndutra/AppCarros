//
//  YearCar.swift
//  Carros
//
//  Created by Elielton Dutra on 21/10/23.
//

import UIKit

class YearCar: UIViewController {

    @IBOutlet var apiYearView: UITableView!
    var years = [Anos?]()
    var codigoBrand: String = ""
    var codigoModel: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(codigoBrand)------- \(codigoModel)")
        loadYear()

        // Do any additional setup after loading the view.
    }
    
    func loadYear(){
        
        CarsAPI.sharedInstance.loadCarsYear(Of: codigoBrand, and: codigoModel) { apiData in
            self.years = apiData
            DispatchQueue.main.async {
                self.apiYearView.reloadData()
                for item in self.years {
                    
                    print(item?.codigo ?? "Error de ")
                }
                
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

extension YearCar: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return years.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellYear")
        else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = years[indexPath.row]?.nome
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Car {
            destination.codigoBrand = codigoBrand
            destination.codigoModel = codigoModel
            destination.codigAnos = years[(apiYearView.indexPathForSelectedRow!.row)]!.codigo
//            print(years[apiYearView.indexPathForSelectedRow!.row]!.nome)
            
        }
    }

    }
    

