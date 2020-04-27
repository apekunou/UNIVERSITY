//
//  StorageManager.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/27/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation
class StorageManager {
    
    static let shared = StorageManager()
    
    struct UserCred: Codable{
        let login: String
        let password: String
    }

    private init(){
        
    }

    func saveUserCredToFile(login: String, password: String, fileName: String) {
        var credData = Data()
        let userCred = UserCred(login: login, password: password)
        do{
            credData = try JSONEncoder().encode(userCred)
        }
        catch {
            print("error during data convertion \(error)")
        }
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let url = urls.first?.appendingPathComponent(fileName) else { return }
        do {
            try credData.write(to: url)
        }
        catch {
            print("error writing data to file \(error)")
        }
    }
    func readUserDataFromFile(fileName: String) {
        var dataFromFile = Data()
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let url = urls.first?.appendingPathComponent(fileName) else { fatalError("No file found") }
        do {
            dataFromFile = try Data(contentsOf: url)
        } catch {
            print("error file reading \(error)")
        }
        do{
            let userCred = try JSONDecoder().decode(UserCred.self, from: dataFromFile)
            print(userCred)
        }
        catch {
            print("error encoding data from file \(error)")
        }
        
    }
}
