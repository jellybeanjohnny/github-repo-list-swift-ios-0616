//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    
    
    static func getRepositoriesWithCompletion(completion: ([NSDictionary]) -> Void) {
        
        guard let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=\(Secrets.githubClientID)&client_secret=\(Secrets.githubSecret)") else {
            return
        }
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let dataTask = session.dataTaskWithURL(githubURL) { (data, response, error) in
            
            guard let data = data else { return }
            
            // Serialize responseData
            do {
                let resultDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [NSDictionary]
                print(resultDictionary)
                completion(resultDictionary)
            } catch {
                print(error)
            }
        }
        
        dataTask.resume()
    }
    
    
}

