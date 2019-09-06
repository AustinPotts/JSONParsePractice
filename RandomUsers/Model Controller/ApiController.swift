//
//  ApiController.swift
//  RandomUsers
//
//  Created by Austin Potts on 9/5/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation



class APIController {
    
    
    var user: [User] = []
    
    let baseURL = URL(string: "https://randomuser.me/api/?format=json&results=20")!
    
    //Completion
    typealias CompletionHandler = (Error?) -> Void
    
    func getUsers(completion: @escaping CompletionHandler = {_ in}) {
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                NSLog("Error Getting Users: \(error)")
            }
            guard let data = data else {
                NSLog("No Data Returned From Data Task.")
                completion(nil)
                return
            }
            do {
              let newUsers = try JSONDecoder().decode(UserResult.self, from: data)
                print(newUsers)
                self.user = newUsers.results
            } catch {
                NSLog("Error decoding Users: \(error)")
                completion(error)
            }
            completion(nil)
        }.resume()
    }
    
}
