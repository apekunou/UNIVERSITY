//
//  NetworkManager.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/13/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

  class NetworkManager {

  static let shared = NetworkManager()
  var usersArray: [User] = []
    
    func fetchUsersData()->[User] {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        guard let uri = url else { return [] }
        var components = URLComponents()
        components.path = uri.path
        components.scheme = uri.scheme
        components.host = uri.host
        var request = URLRequest(url:components.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { ( data, responce, error )
            in
            guard let data = data else { return }
            guard error == nil else {return}
            guard let responce = responce as? HTTPURLResponse,
                (200...299).contains(responce.statusCode)
            else {return}
            do {
                self.usersArray = try JSONDecoder().decode([User].self, from: data)
               // print(self.usersJson)
            } catch {
                print(error)
            }
        }
        task.resume()
        return self.usersArray
    }
}

