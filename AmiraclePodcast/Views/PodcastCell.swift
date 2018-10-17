//
//  PodcastCell.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/12/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImgeView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeLabel.text = "\(String(describing: podcast.trackCount ?? 0)) Episodes"
         
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else {
                return
            }
            podcastImgeView.sd_setImage(with: url, completed: nil)
        }
    }
    
}

