//
//  Podcasts.swift
//  HearIt
//
//  Created by Siddique on 11/03/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var trackCount: Int?
    var artworkUrl600: String?
}
