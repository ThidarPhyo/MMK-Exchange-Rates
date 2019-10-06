//
//  ViewController.swift
//  MMK
//
//  Created by Thidar Phyo on 9/8/19.
//  Copyright © 2019 Thidar Phyo. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let current = "Mand"
    var exchangeRates = [String]()
    var exchangeIcons = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiURLString = "https://forex.cbm.gov.mm/api/"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func fetchData() {
        let latestURLString = apiURLString + "latest"
        guard let latestURL = URL(string: latestURLString) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: latestURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, respone, error) in
            guard error == nil else {return}
            if let httpResponse = respone as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else {return}
                print("Everything is ok")
            }
            guard data != nil else {return}
            print("Hey! I got data")
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]// *******
                {
                    //print(dictionary["description"])
                    //print(dictionary.description)
                    guard let rates = dictionary["rates"] as? [String: String] , let date = dictionary["timestamp"] as? String else {return}
                    print(date)
                    let dateDouble = Double(date)
                    let milisecond = dateDouble
                    let dateVar = Date.init(timeIntervalSince1970: milisecond!)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy"
                    let dt = dateFormatter.string(from: dateVar)
                    let currencies = rates.keys.sorted()
                    //print(currencies)
                    
                    for currency in currencies {
                        if let rate = rates[currency] {
                            //print(rate)
                            //print(currency)
                            self.exchangeRates.append("1 \(currency) = \(rate) MMK")
                            self.exchangeIcons.append(currency)
                            
                            

                        }

                    }
                    print(self.exchangeIcons)
                    
                    OperationQueue.main.addOperation({
                        
                        self.navigationController?.navigationBar.topItem?.title = "Updated on \(dt)"
                    })
    
                    
                }
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }//******
            
        }
        task.resume()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeRates.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateTableViewCell", for: indexPath) as! RateTableViewCell
        self.tableView.reloadRows(at: [indexPath], with: .none)
        cell.nameLabel.text = self.exchangeRates[indexPath.row]
        cell.flatImage?.image = UIImage(named: "\(exchangeIcons[indexPath.row])")
        cell.imageView?.contentMode = .scaleAspectFit
        //print(cell.flatImage.image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
 
}

