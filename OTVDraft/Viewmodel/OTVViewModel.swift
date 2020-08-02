//
//  OTVViewModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 3/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation

/**
 This class is a view model for this program. The class implements an `ObservableObject` protocol so that it can redraw a view if a `Published` object indicates a change. The view model is a class because the program needs to hold reference to a viewmodel instance that will be passed around in the program.
 */
class OTVViewModel: ObservableObject {
    
    //private model which will call objectWillChange.send() when this model changes. objectWillChange.send() is a function
    //that all structs with ObservableObject protocol have. I needa do more research on this tho
    /// The model so the view model can call intent functions on. The variable is initialized with a static function because the model is initialized after this view model object is initialized
    @Published private var model: OTVModel<OTVStreamer> = OTVViewModel.createOTVModel()
    
    //static func to create a model, the model will be made by the api stuff patrick is doing in the future
    //this needs to be static cuz this function is in the class and u cant initialize the model before this function
    /**
     This static function creates a model of type `OTVStreamer`.
     
     - Returns: An `OTVModel<OTVStreamer>` to be used as the model in this program.
     */
    static func createOTVModel() -> OTVModel<OTVStreamer> {
        
        let otvChannel: YoutubeChannel = try! .init(id: "UCDK9qD5DAQML-pzrtA7A4oA")
//        let reevesChannel: YoutubeChannel = try! .init(id: "UCtHaxi4GTYDpJgMSGy7AeSw")
//        let toastChannel: YoutubeChannel = try! .init(id: "UCUT8RoNBTJvwW1iErP6-b-A")
//        let lilyChannel: YoutubeChannel = try! .init(id: "UCvWU1K29wCZ8j1NsXsRrKnA")
//        let pokiChannel: YoutubeChannel = try! .init(id: "UChXKjLEzAB1K7EZQey7Fm1Q")
        print("getting channels")
        
        let streamerMerchInfo: [[Merch]] = [
            [.init(id: 0, price: 44.99, image: "offlinetv1", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-hoodie-black-white-limited-edition"), .init(id: 1, price: 49.99, image: "offlinetv2", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-slant-hoodie-black-yellow-limited-edition"), .init(id: 2, price: 79.99, image: "offlinetv3", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-windbreaker-black-white-limited-edition"), .init(id: 3, price: 19.99, image: "offlinetv4", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-stacked-tee-black"), .init(id: 4, price: 24.99, image: "offlinetv5", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-white"), .init(id: 5, price: 24.99, image: "offlinetv6", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-black")],
            
            [.init(id: 0, price: 25.55, image: "lilyShirt", link: "https://lilypichustore.com/products/temmies-short-sleeve-t-shirt"), .init(id: 1, price: 15.00, image: "lilySticker1", link: "https://lilypichustore.com/products/lily-sticker-set-pack-of-3"), .init(id: 2, price: 15.00, image: "lilySticker2", link: "https://lilypichustore.com/products/temmie-sticker-set-pack-of-3")],
            
            [.init(id: 0, price: 24.99, image: "fedHat", link: "https://metathreads.com/collections/fedmyster/products/fedmyster-black-snapback")],
            
            [.init(id: 0, price: 0.99, image: "gasPoki", link: "https://www.google.com/"), .init(id: 1, price: 2.99, image: "uwuPoki", link: "https://www.google.com/")],
            
            [.init(id: 0, price: 10.99, image: "toast", link: "https://disguisedtoast.com/")]
        ]
        
        let videos: [YoutubeVideo] = [
            .init(id: "x2_nbkP6AU8", title: "BIG SCHNOOZER", thumbnailURL: "https://img.youtube.com/vi/x2_nbkP6AU8/0.jpg", rawDuration: "duration", rawDate: "date"),
            .init(id: "CfR0wln_p8s", title: "Mr. Cow reacts to Daily Dose of Internet", thumbnailURL: "https://img.youtube.com/vi/CfR0wln_p8s/0.jpg", rawDuration: "duration", rawDate: "date")
        ]
        
        let otvVids: [YoutubeVideo] = try! otvChannel.getVideos()
//        let toastVids: [YoutubeVideo] = try! toastChannel.getVideos()
//        let reevesVids: [YoutubeVideo] = try! reevesChannel.getVideos()
//        let lilyVids: [YoutubeVideo] = try! lilyChannel.getVideos()
//        let pokiVids: [YoutubeVideo] = try! pokiChannel.getVideos()
        
        print("getting vids")
        
        
//        let streamers: [OTVStreamer] = [
//            .init(id: 0, name: "OfflineTV", platform: "Youtube", url: "youtube.com/otv", merch: streamerMerchInfo[0], youtubeVideos: videos),
//            .init(id: 1, name: "LilyPichu", platform: "Twitch", url: "twitch.tv/lily", merch: streamerMerchInfo[1], youtubeVideos: videos),
//            .init(id: 2, name: "Michael Reeves", platform: "Robotz", url: "twitch.tv/mykull", merch: streamerMerchInfo[2], youtubeVideos: videos),
//            .init(id: 3, name: "Pokimane", platform: "Twitch", url: "twitch.tv/pokimane", merch: streamerMerchInfo[3], youtubeVideos: videos),
//            .init(id: 4, name: "DisguisedToast", platform: "Youtube", url: "youtube.com/toast", merch: streamerMerchInfo[4], youtubeVideos: videos)
//        ]
        let streamers: [OTVStreamer] = [
            .init(id: 0, name: "OfflineTV", platform: "Youtube", url: "youtube.com/otv", merch: streamerMerchInfo[0], youtubeVideos: otvVids, youtubeChannel: otvChannel),
            .init(id: 1, name: "LilyPichu", platform: "Twitch", url: "twitch.tv/lily", merch: streamerMerchInfo[1], youtubeVideos: otvVids, youtubeChannel: otvChannel),
            .init(id: 2, name: "Michael Reeves", platform: "Robotz", url: "twitch.tv/mykull", merch: streamerMerchInfo[2], youtubeVideos: otvVids, youtubeChannel: otvChannel),
            .init(id: 3, name: "Pokimane", platform: "Twitch", url: "twitch.tv/pokimane", merch: streamerMerchInfo[3], youtubeVideos: otvVids, youtubeChannel: otvChannel),
            .init(id: 4, name: "DisguisedToast", platform: "Youtube", url: "youtube.com/toast", merch: streamerMerchInfo[4], youtubeVideos: otvVids, youtubeChannel: otvChannel)
        ]
        return OTVModel<OTVStreamer>(streamers: streamers)
    }
    
    // MARK: - Access to model
    /// a copy of the `Array<OTVStreamer>` in model so the program can access the model view only.
    var streamers: Array<OTVStreamer> {
        model.streamers
    }
    
    // MARK: - Intents
    //some getter functions prob
    
    //function gets latest x videos from all streamers
    //if we want to implement filters in the future, we should use a calculated streamers array that filters and checks for latest videos
    //for now its hard coded
    /**
     This function gets a given number of latest videos in an `Array`.
     
     - Parameter numVid: the number of videos to return
     
     - Returns: an `Array<YoutubeVideo>` of the latest youtube videos from streamers
     */
    func getLatestVideos(latest numVid: Int) -> Array<YoutubeVideo>{
        [ .init(id: "x2_nbkP6AU8", title: "BIG SCHNOOZER", thumbnailURL:
            "https://i.ytimg.com/vi/x2_nbkP6AU8/mq1.jpg", rawDuration: "duration", rawDate: "2020-07-10T21:00:11Z"),
          .init(id: "CfR0wln_p8s", title: "Mr. Cow reacts to Daily Dose of Internet", thumbnailURL: "https://img.youtube.com/vi/CfR0wln_p8s/0.jpg", rawDuration: "duration", rawDate: "2020-07-10T21:00:11Z")
        ]
    }
}
