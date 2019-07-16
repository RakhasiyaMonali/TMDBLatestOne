//
//  Alert.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import Foundation
import UIKit

typealias FilteredYearBlock = (String, String) -> Void

class Alert : UIViewController {
    func showAlert(title: String, message: String, btnTitle: String, callback: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: {
            alertAction in
            callback()
        }))
        
        DispatchQueue.main.async {
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTextFields(callback: @escaping FilteredYearBlock) {
        let alertController = UIAlertController(title: "Filter by years", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter minimum year"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter maximum year"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        let saveAction = UIAlertAction(title: "Filter", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            callback(firstTextField.text ?? "", secondTextField.text ?? "")
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async {
            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
            alertWindow.rootViewController = UIViewController()
            alertWindow.makeKeyAndVisible()
            alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
