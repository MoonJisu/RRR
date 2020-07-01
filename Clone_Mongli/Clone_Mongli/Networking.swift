//
//  Networking.swift
//  Clone_Mongli
//
//  Created by 문지수 on 2020/07/01.
//  Copyright © 2020 문지수. All rights reserved.
//

import UIKit

let URL: String  = "https://mongli.site/api/"

enum server: String {
    case auth = "auth"
    
    func linkapi(name: String) -> String{
        switch  name {
        case server.auth.rawValue:
            return URL + server.auth.rawValue
        default:
            return "Hi"
        }
        
    }

}
