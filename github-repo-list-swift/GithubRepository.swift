//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: NSString
    var htmlURL = NSURL()
    var repositoryID = NSString()
    
    init(dictionary: NSDictionary) {
        fullName = dictionary["full_name"] as! NSString
        let urlString = dictionary["html_url"] as! NSString
        if let url = NSURL(string: urlString as String) {
            htmlURL = url
        }
        if let id = dictionary["id"] {
            repositoryID = id.stringValue
        }
    }
    
    
}
