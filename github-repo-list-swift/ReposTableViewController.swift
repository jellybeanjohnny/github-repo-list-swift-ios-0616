//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var repos: [GithubRepository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        ReposDataStore.sharedInstance.getRepositoriesWithCompletion { 
            self.repos = ReposDataStore.sharedInstance.repositories
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        let repo = repos[indexPath.row]
        
        cell.textLabel?.text = repo.fullName as String
        cell.detailTextLabel?.text = repo.repositoryID as String
        
        return cell
    }

}
