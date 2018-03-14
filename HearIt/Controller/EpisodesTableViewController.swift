//
//  EpisodesTableViewController.swift
//  HearIt
//
//  Created by Siddique on 14/03/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

}
