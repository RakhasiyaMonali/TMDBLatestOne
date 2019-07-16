//
//  RegistrationViewController.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//
import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPw: UITextField!
    @IBOutlet weak var txtConfirmPW: UITextField!
    
    lazy var presenter = RegistrationParser(delegate: self)
    
    var alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSignClicked(_ sender: Any) {
        self.view.becomeFirstResponder()
        guard let textEmail = txtEmailId.text, !textEmail.isEmpty,
            let textPw = txtPw.text, !textPw.isEmpty,
            let textConfirmPw = txtConfirmPW.text, !textConfirmPw.isEmpty else {
                alert.showAlert(title: "", message: "Please enter all details", btnTitle: "Ok") {}
                return
        }
        presenter.checkvalidation(email: textEmail, password: textPw, ConfirmPW: textConfirmPw)
    }
    
}

extension RegistrationViewController: RegistrationDelegate {
    func RegisterWithSuccess() {
        alert.showAlert(title: "", message: "Registered successfully", btnTitle: "Ok") {}
    }
    
    func pushToMovieListVC() {
        if let movielistvc = self.storyboard?.instantiateViewController(withIdentifier: "MovieListVC") as? MovieListVC {
            self.navigationController?.pushViewController(movielistvc, animated: true)
        }
    }
    
    func showError(message: String) {
        alert.showAlert(title: "", message: message, btnTitle: "Ok") {}
    }
}
