//
//  YoutubeVidView.swift
//  OTVDraft
//
//  Created by Saahil Kumar on 7/30/20.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeVidView: View {
        var vid: YoutubeVideo
        
        var size: CGSize
        
        // MARK: - Drawing Constants
        var imageWidth: CGFloat
        var imageHeight: CGFloat
        var youtubeTitleScaleFactor: CGFloat
        var youtubeDescriptionScaleFactor: CGFloat
        
        init(vid: YoutubeVideo, size: CGSize, w imageWidth: CGFloat, h imageHeight: CGFloat, titleScaleFactor youtubeTitleScaleFactor: CGFloat, descScaleFactor youtubeDescriptionScaleFactor: CGFloat) {
            self.vid = vid
            self.size = size
            self.imageWidth = imageWidth
            self.imageHeight = imageHeight
            self.youtubeTitleScaleFactor = youtubeTitleScaleFactor
            self.youtubeDescriptionScaleFactor = youtubeDescriptionScaleFactor
        }
        
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                ZStack {
                    Button(action: {
                        let url: NSURL = URL(string: self.vid.url)! as NSURL
                        
                        UIApplication.shared.open(url as URL)
                    }) {
                        URLImageView(urlString: vid.thumbnailURL, width: imageWidth, height: imageHeight, cShape: 1)
                    }.buttonStyle(PlainButtonStyle())
                        .shadow(radius: 10)
                    GeometryReader { g in
                        ZStack {
                            Color.black
                                .frame(width: g.size.width / 5, height: g.size.width / 15)
                                .cornerRadius(20)
                                .opacity(0.7)
                            Text(self.vid.formattedDuration ?? "")
                            .font(.system(size: g.size.height / 15))
                                .foregroundColor(.white)
                        }.offset(x: g.size.width / 2.8, y: g.size.height / 4)
                    }
                }
                
                VStack (alignment: .leading) {
                    Text(vid.title)
                        .toYoutubeTitle(fontScaleFactor: youtubeTitleScaleFactor, size: size, color: .black)
                        .frame(width: imageWidth, alignment: .leading)
                        
                    Text("100 views • \(vid.howLongAgo ?? "Unknown Date")")
                        .toYoutubeDescription(fontScaleFactor: youtubeDescriptionScaleFactor, size: size, color: .gray)
                }
            }
        }
}

struct YoutubeVidView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVidView(vid: .init(id: "x2_nbkP6AU8", title: "BIG SCHNOOZER", thumbnailURL: "https://img.youtube.com/vi/x2_nbkP6AU8/0.jpg", rawDuration: "duration", rawDate: "date"), size: CGSize(width: 60, height: 80), w: 100, h: 80, titleScaleFactor: 0.04, descScaleFactor: 0.03)
    }
}
