//
//  Alert.swift
//  MMK
//
//  Created by Thidar Phyo on 10/16/19.
//  Copyright © 2019 Thidar Phyo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func presentActionSheet(title: String, message: String) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let passAction = UIAlertAction(title: "OKAY", style: .default) { (_) in
            
        }
        //let destriveAction = UIAlertAction(title: "Destory", style: .destructive, handler: nil)
        actionSheet.addAction(passAction)
        //actionSheet.addAction(destriveAction)
        present(actionSheet, animated: true, completion: nil)
    }
}
struct Alert {
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}
