//
//  CollectionDataSource.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/14/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation
import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource  {
    
    public static let shared = CollectionDataSource()
    var usersArray: [User] = []
    
    override init() {
        //super init()
        //var usersArray = NetworkManager.shared.fetchUsersData()
        usersArray = NetworkManager.shared.usersArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkManager.shared.usersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = NetworkManager.shared.usersArray[indexPath.row]
        
        let cellDef = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCollectionViewCell.id, for: indexPath)
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCollectionViewCell.id, for: indexPath) as? CodeCollectionViewCell{
            cell.textLabel?.text = user.name + " " + user.username
            return cell
        }
            else{
                
        }
        DispatchQueue.main.async {
                       collectionView.reloadData()
                       }
        return cellDef
    }
}
