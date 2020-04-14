//
//  File.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/13/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

class PasswordValidator {
    public static func checkPassword(_ password:String) -> Bool{
        if password == "" || password.count < 6 {
            return false
        }
        else {
            return true
        }
    }
    
}
