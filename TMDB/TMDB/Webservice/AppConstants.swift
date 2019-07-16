//
//  AppConstants.swift
//  TMDB
//
//  Created by Monali on 05/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    static let protocolo    : String = "https://"
    static let apiVersion   : String = "/3"
    static let domain       : String = "api.themoviedb.org"
    static let keys         : String = "/movie/popular"
    static let domainImage  : String = "https://image.tmdb.org/t/p/original"
    static let apiKey       : String = "45b131386388a8fd5622c4ee765ffbcf"
    static let keyPath      : String = "?api_key="
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain + AppConstants.apiVersion + AppConstants.keys + keyPath + AppConstants.apiKey
}
