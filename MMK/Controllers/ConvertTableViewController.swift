//
//  ConvertTableViewController.swift
//  MMK
//
//  Created by Thidar Phyo on 10/13/19.
//  Copyright © 2019 Thidar Phyo. All rights reserved.
//

import UIKit

class ConvertTableViewController: UITableViewController {

    @IBOutlet weak var dollarAmount: UITextField!
    
    @IBOutlet weak var myanmarLabel: UILabel!
    
    @IBOutlet weak var japanLabel: UILabel!
    
    var countryRate: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        print("CC",countryRate)
    }
    
    @IBAction func tapTheView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        guard let amt = dollarAmount.text else {
            print("Invalid amount")
            return
        }
        if isValidAmount(amt) {
            print("Valid")
            let dollarAmountText = Double(dollarAmount.text!)
            //let mm = countryRate
            //print("MM",mm)
            print("String-----",countryRate)
            let mmk = countryRate.replacingOccurrences(of: ",", with: "")
            let mm = Double(mmk)
            //let mmk = Double(countryRate.trimmingCharacters(in: CharacterSet.whitespaces))
            print("Double----", mmk)
            let myan = dollarAmountText! * mm!
            
            print("Myan",myan)
            myanmarLabel.text = "\(myan.rounded())"
        } else {
            //print("Wrong")
            Alert.showBasicAlert(on: self, with: "Please Fill", message: "Your amount!")
        }

        
//        let jpy = 1426.0
//        let japanText = dollarAmountText! * jpy
//        japanLabel.text = String(japanText)
        
    }
    func isValidAmount(_ amount: String) -> Bool {
        return amount.count >= 1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dollarAmount.becomeFirstResponder()
    }
    func setupTextFields() {
        let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 50)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolBar.setItems([flexSpace,doneBtn], animated: false)
        dollarAmount.inputAccessoryView = toolBar
    }
    @objc func doneButtonAction() {
//        self.button.tintColor = .white
        self.view.endEditing(true)
    }
    func textfieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}
