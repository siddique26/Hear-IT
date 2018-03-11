//
//  SearchViewController.swift
//  HearIt
//
//  Created by Siddique on 11/03/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController,UISearchBarDelegate {
    
    var podcasts: [Podcast] = Array()
    let cellID = "cellID"
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSearchBar()
        setUpTableView()
    }
    func setUpSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    func setUpTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let podcast = podcasts[indexPath.row]
        cell.imageView?.image = #imageLiteral(resourceName: "podcast-default-cover-art")
        cell.textLabel?.text = "\(podcast.trackName ?? "")\nby \(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = -1
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIService.shared.fetchPodcasts(using: searchText) { (searchResults) in
            self.podcasts = searchResults
            self.tableView.reloadData()
        }
    }
}
