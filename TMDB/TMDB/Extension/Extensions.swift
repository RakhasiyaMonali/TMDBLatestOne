//
//  ImageExtension.swift
//  TMDBMVVM
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(from link: String) {
        let imageUrl = AppConstants.domainImage + link
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
}

extension String {
    func isEmailValidate() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    func formateTitle() -> String {
        let strYear = self.components(separatedBy: "-")[0]
        return strYear
    }
}
