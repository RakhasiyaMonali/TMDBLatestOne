//
//  LoginViewController.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LoginViewController : UIViewController {
    
    lazy var presenter = LoginPresenter(delegate: self)
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

        txtEmailId.text = ""
        txtPW.text = ""
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        self.view.endEditing(true)
        presenter.checkRegisteredOrNot(email: txtEmailId.text ?? "", password: txtPW.text ?? "")
    }
    
    @IBAction func btnSigninClicked(_ sender: Any) {
        self.view.endEditing(true)
        if let SignInVc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController {
            self.navigationController?.pushViewController(SignInVc, animated: true)
        }
    }
}


extension LoginViewController :LoginDelegate {
    func loginWithSuccess() {
        if let movielistvc = self.storyboard?.instantiateViewController(withIdentifier: "MovieListVC") as? MovieListVC {
            self.navigationController?.pushViewController(movielistvc, animated: true)
        }
    }
    
    func showError(message: String) {
        let alert = Alert()
        alert.showAlert(title: "", message: message, btnTitle:"Ok") {}
    }
}
