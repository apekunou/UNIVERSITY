//
//  File.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/13/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

class LoginManager {

    public static let shared = LoginManager()
    
    private init()
    {
        
    }
    
    func isLogined() -> Bool {
      let value = UserDefaults.standard.value(forKey: "userLogined")
        guard let vl = value as? String else { return false}
        if vl == "true"{
            return true
        }
        else {
            return false
        }
    }
    
    func makeLogin(login: String, password: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(login, forKey: "userLogin")
        userDefaults.set(password, forKey: "userPassword")
        userDefaults.set("true", forKey: "userLogined")
    }
    
    func makeLogoff() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("", forKey: "userLogin")
        userDefaults.set("", forKey: "userPassword")
        userDefaults.set("false", forKey: "userLogined")
    }
        
}

