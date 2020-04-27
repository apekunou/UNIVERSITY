//
//  PersonsCollectionViewController.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/12/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class PersonsCollectionViewController: UIViewController {

    var collectionView:UICollectionView
    var cellID = "cell"
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder:coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(CodeCollectionViewCell.self, forCellWithReuseIdentifier: CodeCollectionViewCell.id)
        collectionView.dataSource = CollectionDataSource.shared
        collectionView.delegate = self
        collectionView.backgroundColor = .purple
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //let settingsBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
        let settingsBtn = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsAction))
        //settingsBtn.title = "settings"
        navigationItem.rightBarButtonItem = settingsBtn
       // navigationBar.setItems([navigationItem], animated: false)
    }

    @objc func settingsAction(){
        if let vc = storyboard?.instantiateViewController(identifier:"SettingsViewController") as? SettingsViewController {
            navigationController?.pushViewController(vc,animated: true)
        }
    }
}

extension PersonsCollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 2 == 0 {
            return CGSize(width: 350, height: 100)
        } else {
            return CGSize(width: 350, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier:"ProfileViewController") as? ProfileViewController {
            let user = CollectionDataSource.shared.usersArray[indexPath.row]
            vc.firstName = user.name
            vc.secondName = user.username
            navigationController?.pushViewController(vc,animated: true)
        }
    }
}

