//
//  ViewController.swift
//  Carros
//
//  Created by Elielton Dutra on 21/10/23.
//

import UIKit

class ViewController: UIViewController {

    var apiResult = [Brand]()
    @IBOutlet var apiDataView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiDataView.delegate = self
        self.apiDataView.dataSource = self
        Bundle.main.loadNibNamed("BrandHeaderView", owner: self)
        let nib = UINib(nibName: BrandHeaderView.indentifier, bundle: nil)
        self.apiDataView.register(nib, forHeaderFooterViewReuseIdentifier: BrandHeaderView.indentifier)
        
        CarsAPI.sharedInstance.loadCars() { apiData in
            self.apiResult = apiData
            DispatchQueue.main.async {
                self.apiDataView.reloadData()

            }
        }
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: BrandHeaderView.indentifier) as? BrandHeaderView
        header?.brandLabel.text = "Marca"
        return header
      
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView,
                       heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailCar {
            destination.cod = apiResult[(apiDataView.indexPathForSelectedRow?.row)!].codigo
//          apiDataView.deselectRow(at: [apiDataView.indexPathsForSelectedRows], animated: true)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellProto")
        else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = apiResult[indexPath.row].nome
        
        return cell
    }
    
}


