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
    let cellHeight: CGFloat = 132
    let headerHeight: CGFloat = 250
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSearchBar()
        setUpTableView()
    }
    func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    func setUpTableView() {
        //remove divider line
        tableView.tableFooterView = UIView()
        
        //Register cell nib
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeController = EpisodesTableViewController()
        episodeController.podcast = podcasts[indexPath.row]
        navigationController?.pushViewController(episodeController, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            as! PodcastCell
        cell.podcast = podcasts[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIService.shared.fetchPodcasts(using: searchText) { (searchResults) in
            self.podcasts = searchResults
            self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nullLabel = UILabel()
        nullLabel.text = "Please enter a search term to discover new Podcasts."
        nullLabel.numberOfLines = 2
        nullLabel.textAlignment = .center
        nullLabel.font = UIFont.systemFont(ofSize: 22)
        nullLabel.textColor = UIColor.purpleColor
        return nullLabel
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.podcasts.count == 0 ? headerHeight : 0
    }
}
