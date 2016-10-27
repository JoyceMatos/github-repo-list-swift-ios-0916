//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(completion: @escaping () -> Void) {
        
        self.repositories.removeAll()
        
        GithubAPIClient.getRepositories { (repos) in
            
            for repo in repos {
                
                var gitRespository = GithubRepository.init(dictionary: repo)
                self.repositories.append(gitRespository)
            }
            completion()
        }
    }
}


