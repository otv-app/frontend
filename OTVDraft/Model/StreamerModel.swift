//
//  StreamerModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation

//not sure if some structs here should belong unqiuely to the OTVModel.swift but idk
//maybe change some variables into enums but idk

//a specific type of streamer, OTVStreamer which also has a merch
struct OTVStreamer: Streamer {
    var id: Int
    var name: String
    let platform: String
    let url: String
    let merch: StreamerMerch
}

//protocol for a streamer
protocol Streamer: Identifiable {
    var id: Int { get }
    var name: String { get }
    var platform: String { get }
    var url: String { get }
}

struct Merch: Identifiable {
    let id: Int
    let price: Double
    let image: String
    let link: String
}

//CHANGE: moved name variable to the Streamer protocol
struct StreamerMerch: Identifiable {
    let id: Int
    let merches: [Merch]
}
