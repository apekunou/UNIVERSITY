//
//  SettingsViewController.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/21/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   let stackView = UIStackView(arrangedSubviews:[])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(stackView)
         stackView.axis = .vertical
         stackView.alignment = .fill //.center
       //  stackView.distribution = .equalCentering
         stackView.distribution = .equalSpacing
         stackView.spacing = 50
         stackView.translatesAutoresizingMaskIntoConstraints = false

         stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        let items = ["Defaul" , "Light Mode", "Dark"]
           let segmentedControl = UISegmentedControl(items : items)
          // segmentedControl.center = self.view.center
        if let style = UserDefaults.standard.value(forKey: "style") as? Int {
            segmentedControl.selectedSegmentIndex = style
        }
        else{
            segmentedControl.selectedSegmentIndex = 0
        }
           segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
           segmentedControl.layer.cornerRadius = 5.0
           segmentedControl.backgroundColor = .red
           segmentedControl.tintColor = .yellow
        
        let buttonView = UIView()
        let logoutButton = UIButton(type: .system)
           logoutButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
           logoutButton.setTitle("Log out", for: .normal)
           logoutButton.addTarget(self, action: #selector(logoutAction(_:)), for: .touchUpInside)

        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(logoutButton)
        

            
        }
        @objc func indexChanged(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex{
                case 0:
                  self.parent?.overrideUserInterfaceStyle = .unspecified
                  UserDefaults.standard.set(0, forKey: "style")
                case 1:
                  self.parent?.overrideUserInterfaceStyle = .light
                  UserDefaults.standard.set(1, forKey: "style")
                case 2:
                  self.parent?.overrideUserInterfaceStyle = .dark
                  UserDefaults.standard.set(2, forKey: "style")
                default:
                    break
                }
        }
        @objc func logoutAction(_ sender:UIButton!) {
            LoginManager.shared.makeLogoff()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //let initialVC = UIViewController()
             let initialVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
 
            guard let navigationController = self.navigationController else { return }
            var navigationArray = navigationController.viewControllers
            navigationArray.removeAll()
            navigationArray.insert(initialVC, at: 0)
            self.navigationController?.viewControllers = navigationArray
          
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
