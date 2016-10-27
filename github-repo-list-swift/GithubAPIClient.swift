//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String: Any]]) -> Void) {
        print("running")
        let urlString = "https://api.github.com/repositories?client_id= fc68a7f2d58e34bf72c5&client_secret=e8f3eb2e34ecc3c5912d79cb8f926836975fe4d0"
        
        let url = URL(string: "https://api.github.com/repositories?client_id=fc68a7f2d58e34bf72c5&client_secret=e8f3eb2e34ecc3c5912d79cb8f926836975fe4d0")
        
        if let unwrappedUrl = url {
            let session = URLSession.shared
            print("running")
            let task = session.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
                print("even more running")
                if let data = data {
                    
                    do {
                        
                        let responseJSONArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                        
                        for responseJson in responseJSONArray{
                            let name = responseJson["full_name"] as! String
                            
                            print(name)
                        }
                        
                        completion(responseJSONArray)
                        
                    } catch {
                        
                        print("You have an error!")
                        
                    }
                    
                    
                }
            })
            
            task.resume()
            
        } else {
            print("why am i not working \(url)")
        }
    }
    
    
    
    
}





