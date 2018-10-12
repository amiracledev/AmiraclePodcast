//
//  PodcastsSearchController.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/12/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    let cellID = "cellId"
    let podcasts = [
        Podcast.init(name: "Let's Test this out ", artistName: "Amir, Nickroo"), Podcast.init(name: "Testing this one ", artistName: "AmiracleDev")
    ]
       //adding searchController
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupSearchBar()
        setupTableView()
    }
    
    
    //MARK:- SETUP
    //MARK: Setup TableView
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    //MARK: Setup SEARCHBAR
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    //MARK: Searchbar Text Entered
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        //Itunes Api info
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        Alamofire.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact itunes api", err)
                return
            }
            guard let data = dataResponse.data else {
                return
            }
            
            let dumString = String(data: data, encoding: .utf8)
            print(dumString ?? "")
        }
        
    print(searchText)
    }
    
    //MARK:- UITABLEVIEW
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = UIImage(named: "appicon")
        return cell
    }
    
    
    
}
