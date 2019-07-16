//
//  LoginPresenter.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import Foundation
import CoreData

protocol LoginDelegate: class {
    func showError(message: String)
    func loginWithSuccess()
}

class LoginPresenter {
    
    private weak var loginDelegate : LoginDelegate?
    
    init(delegate : LoginDelegate) {
        self.loginDelegate = delegate
    }
        
    func checkRegisteredOrNot(email : String , password : String) {
        guard !email.isEmpty, !password.isEmpty else {
            loginDelegate?.showError(message: "Please enter login credentials")
            return
        }
        
        let isvalidEmailid = email.isEmailValidate()
        if !isvalidEmailid {
            loginDelegate?.showError(message: "Please enter valid email address")
            return
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let searchString = email
        let searcghstring2 = password
        request.predicate = NSPredicate (format: "emailId == %@", searchString)
        let managedContext = AppDelegate.sharedInstance().persistentContainer.viewContext
        
        do {
            let result = try managedContext.fetch(request)
            if result.count > 0 {
                let n = (result[0] as AnyObject).value(forKey: "emailId") as! String
                let p = (result[0] as AnyObject).value(forKey: "password") as! String
                if (searchString == n && searcghstring2 == p) {
                    loginDelegate?.loginWithSuccess()
                }
                else if (searchString == n || searcghstring2 == p) {
                    loginDelegate?.showError(message: "Please enter valid password")
                }
            }
            else {
                loginDelegate?.showError(message: "Invalid credentials")
            }
        }
        catch {
            print("error")
        }
    }
}


