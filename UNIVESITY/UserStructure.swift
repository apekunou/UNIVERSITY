//
//  UserStructure.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/13/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
}

struct UserAddress: Codable {
      let street: String
      let suite: String
      let city: String
      let zipcode: String
//      let geo: AddressGeo
}

    struct AddressGeo: Codable{
        let lat: Double
        let lng: Double
}

