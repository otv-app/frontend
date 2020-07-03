//
//  OTVViewModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 3/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation

//view model is a class since I want to pass a reference to a viewmodel
class OTVViewModel: ObservableObject {
    
    //private model which will call objectWillChange.send() when this model changes. objectWillChange.send() is a function
    //that all structs with ObservableObject protocol have. I needa do more research on this tho
    @Published private var model: OTVModel<OTVStreamer> = OTVViewModel.createOTVModel()
    
    //static func to create a model, the model will be made by the api stuff patrick is doing in the future
    //this needs to be static cuz this function is in the class and u cant initialize the model before this function
    static func createOTVModel() -> OTVModel<OTVStreamer> {
        let streamerMerchInfo: [StreamerMerch] = [
            .init(id: 0, merches: [.init(id: 0, price: 44.99, image: "offlinetv1", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-hoodie-black-white-limited-edition"), .init(id: 1, price: 49.99, image: "offlinetv2", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-slant-hoodie-black-yellow-limited-edition"), .init(id: 2, price: 79.99, image: "offlinetv3", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-windbreaker-black-white-limited-edition"), .init(id: 3, price: 19.99, image: "offlinetv4", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-stacked-tee-black"), .init(id: 4, price: 24.99, image: "offlinetv5", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-white"), .init(id: 5, price: 24.99, image: "offlinetv6", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-black")]),
            .init(id: 1, merches: [.init(id: 0, price: 25.55, image: "lilyShirt", link: "https://lilypichustore.com/products/temmies-short-sleeve-t-shirt"), .init(id: 1, price: 15.00, image: "lilySticker1", link: "https://lilypichustore.com/products/lily-sticker-set-pack-of-3"), .init(id: 2, price: 15.00, image: "lilySticker2", link: "https://lilypichustore.com/products/temmie-sticker-set-pack-of-3")]),
            .init(id: 2, merches: [.init(id: 0, price: 24.99, image: "fedHat", link: "https://metathreads.com/collections/fedmyster/products/fedmyster-black-snapback")]),
            .init(id: 3, merches: [.init(id: 0, price: 0.99, image: "gasPoki", link: "https://www.google.com/"), .init(id: 1, price: 2.99, image: "uwuPoki", link: "https://www.google.com/")]),
            .init(id: 4, merches: [.init(id: 0, price: 10.99, image: "toast", link: "https://disguisedtoast.com/")])
        ]
        let streamers: [OTVStreamer] = [
            .init(id: 0, name: "OfflineTV", platform: "Youtube", url: "youtube.com/otv", merch: streamerMerchInfo[0]),
            .init(id: 1, name: "LilyPichu", platform: "Twitch", url: "twitch.tv/lily", merch: streamerMerchInfo[1]),
            .init(id: 2, name: "Predmyster", platform: "Rehab", url: "twitch.tv/pred", merch: streamerMerchInfo[2]),
            .init(id: 3, name: "Pokimane", platform: "Twitch", url: "twitch.tv/pokimane", merch: streamerMerchInfo[3]),
            .init(id: 4, name: "DisguisedToast", platform: "Youtube", url: "youtube.com/toast", merch: streamerMerchInfo[4])
        ]
        return OTVModel<OTVStreamer>(streamers: streamers)
    }
    
    // MARK: - Access to model
    var streamers: Array<OTVStreamer> {
        model.streamers
    }
    
    // MARK: - Intents
    //some getter functions prob
}
