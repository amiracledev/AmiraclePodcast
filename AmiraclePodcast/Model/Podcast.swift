//
//  Podcast.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/12/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
    
}

