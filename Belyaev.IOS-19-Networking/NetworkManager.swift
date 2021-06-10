//
//  NetworkManager.swift
//  Belyaev.IOS-19-Networking
//
//  Created by максим  кондратьев  on 10.06.2021.
//

import Foundation

class NetworkManager {
    
    func getAllPosts (_ complitionHandler:  @escaping ([Post])->Void) {
        
        if  let url = URL(string: "http://jsonplaceholder.typicode.com/posts") {
        let task =  URLSession.shared.dataTask(with: url) {  (data, response ,error ) in
            
            if  error != nil {
                print("error in request")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                return
            }
            if  let responseData = data {
                let posts = try? JSONDecoder().decode([Post].self, from: responseData)
               
                complitionHandler(posts ?? [])
                print(posts)
            }
        }
            task.resume()
        }
    }
    

}

