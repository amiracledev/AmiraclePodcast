//
//  EpisodesController.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/17/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//
import UIKit

class EpisodesController: UITableViewController {

    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
fileprivate let cellId = "cellId"
    struct Episode {
        let title: String
    }
    
    
    var episodes = [
    Episode(title: "iouenriuniv"),
        Episode(title: "eiwhdbciewhrbe")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    //MARK:- TableView Setup
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
    
    
}
