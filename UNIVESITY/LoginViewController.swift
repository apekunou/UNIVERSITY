//
//  ViewController.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/12/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var loginText: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var incorrectPasswordLabel: UILabel!
    
    @IBAction func loginPressed(_ sender: Any) {
          let usersJson = NetworkManager.shared.fetchUsersData()
//        do {
            sleep(2)
//        }
//        print(usersJson)
        var password = passwordText.text ?? ""
        var login = loginText.text ?? ""
        if PasswordValidator.checkPassword(password) != true || login == ""
        {
          incorrectPasswordLabel.isHidden = false
          incorrectPasswordLabel.textColor = .red
          return
        }
        LoginManager.shared.makeLogin(login: login, password: password)
        if let personsVC = storyboard?.instantiateViewController(identifier:"PersonsCollectionViewController") as? PersonsCollectionViewController {
            navigationController?.pushViewController(personsVC,animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

