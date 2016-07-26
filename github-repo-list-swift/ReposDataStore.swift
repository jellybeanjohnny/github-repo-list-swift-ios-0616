//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (dataArray) in
            self.repositories.removeAll()
            for repo in dataArray {
                self.repositories.append(GithubRepository(dictionary: repo))
            }
            completion()
        }
    }
}
