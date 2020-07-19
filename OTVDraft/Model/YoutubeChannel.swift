//
//  YoutubeChannel.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/3/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//
import Foundation

class YoutubeChannel {
    var id: String
    var username: String
    var pfpURL: String
    
    init(id: String) throws {
        self.id = id
        
        let pfpAPIURL = "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=" + id + "&fields=items%2Fsnippet%2Fthumbnails&key=" + Key.YTAPIKEY
        
        self.pfpURL = try Utility.getYoutubePFP(url: pfpAPIURL)
        
        let channelAPIURL = "https://www.googleapis.com/youtube/v3/search?key=" + Key.YTAPIKEY + "&channelId=" + id + "&part=snippet,id&order=date&maxResults=20"
        
        self.username = try Utility.getYoutubeUsername(url: channelAPIURL)
    }
    
    func getVideos() throws -> [YoutubeVideo] {
        
        let apiURL = "https://www.googleapis.com/youtube/v3/search?key=" + Key.YTAPIKEY + "&channelId=" + self.id + "&part=snippet,id&order=date&maxResults=20"
        let jsonFormattedVideos: [VideoInfo] = try Utility.getYoutubeVideosJSON(url: apiURL)
        
        var listOfVideos: [YoutubeVideo] = []
        
        for videoInfo in jsonFormattedVideos {
            let rawDurationVid = try Utility.getYoutubeVideoRawDuration(id: videoInfo.id.videoId)
            listOfVideos.append(YoutubeVideo(id: videoInfo.id.videoId,
                                             title: videoInfo.snippet.title,
                                             thumbnailURL: videoInfo.snippet.thumbnails.defaultThumb.url,
                                             rawDuration: rawDurationVid,
                                             rawDate: videoInfo.snippet.publishedAt))
        }
        
        
        return listOfVideos
    }
}
