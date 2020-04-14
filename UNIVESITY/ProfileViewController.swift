//
//  ProfileViewController.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/14/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var animationView = UIView(frame: CGRect(x:100, y:100, width: 100, height: 100) )
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var userInfoText: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    public var login = ""
    
    public var firstName = ""
    
    public var secondName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView) //!!!!!!
        
        firstNameLabel?.text = firstName
        secondNameLabel?.text = secondName

        // Do any additional setup after loading the view.
            profilePrep()

    }
    
    override func viewDidAppear(_ animated: Bool) {
         super .viewDidAppear(animated)
    }
    
    func profilePrep() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoText.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -100).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -220).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 170).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 170).isActive = true
        profileImage.backgroundColor = .lightGray
        
        firstNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 80).isActive = true
        firstNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -250).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        secondNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 80).isActive = true
        secondNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -200).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        userInfoText.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        userInfoText.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        userInfoText.widthAnchor.constraint(equalToConstant: 350).isActive = true
        userInfoText.heightAnchor.constraint(equalToConstant: 450).isActive = true
    }

}
