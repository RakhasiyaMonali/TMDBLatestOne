//
//  RegisterPresenter.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import Foundation
import CoreData

protocol RegistrationDelegate: class {
    func showError(message: String)
    func pushToMovieListVC()
    func RegisterWithSuccess()
}

class RegistrationParser {
    
    weak var registerDelegate : RegistrationDelegate?
    
    init(delegate : RegistrationDelegate) {
        self.registerDelegate = delegate
    }
    
    func checkvalidation(email : String, password : String, ConfirmPW : String)  {
        let isvalidEmailid = email.isEmailValidate()
        if !isvalidEmailid {
            registerDelegate?.showError(message: "Please enter valid email address")
            return
        }
        else if password != ConfirmPW {
            registerDelegate?.showError(message: "Password mismatch")
            return
        }
        else {
            self.saveToDb(emailID: email, password: password)
            self.registerDelegate?.pushToMovieListVC()
            self.registerDelegate?.RegisterWithSuccess()
        }
    }
    
    func saveToDb(emailID : String, password : String) {
        let managedContext = AppDelegate.sharedInstance().persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let User = NSManagedObject(entity: entity, insertInto: managedContext)
        User.setValue(emailID, forKeyPath: "emailId")
        User.setValue(password, forKeyPath: "password")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
