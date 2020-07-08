//
//  YoutubeStreamerView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeStreamerView: View {
    
    @ObservedObject var viewModel: OTVViewModel
    
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        NavigationView {
            List {
                ForEach(viewModel.streamers) {
                    streamer in YoutubeRowView(streamer: streamer, size: size)
                }
            }.navigationBarTitle(Text("By Channel"))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct YoutubeRowView: View {

    var streamer: OTVStreamer
    
    var size: CGSize
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(streamer.name).font(.system(size: size.height * youtubeChannelNameScaleFactor)).fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(streamer.youtubeVideos) {
                        item in YoutubeVidView(vid: item, size: self.size).padding(5)
                    }
                }
            }
        }
    }
    
    // MARK: - Drawing Constants
    let youtubeChannelNameScaleFactor: CGFloat = 0.05
}

struct YoutubeVidView: View {
    
    var vid: YoutubeVideo
    
    var size: CGSize
    
    var body: some View {
        VStack (alignment: .leading) {
            URLImageView(urlString: vid.thumbnailURL, width: imageWidth, height: imageHeight)
            
            VStack (alignment: .leading){
                Text(vid.title)
                    .toYoutubeTitle(fontScaleFactor: youtubeTitleScaleFactor, size: size, color: .black)
                    .frame(width: imageWidth, alignment: .leading)
                    
                Text("\(vid.views) views • \(vid.rawDate)")
                    .toYoutubeDescription(fontScaleFactor: youtubeDescriptionScaleFactor, size: size, color: .gray)
            }
        }
    }
    
    //MARK: - Drawing Constants
    let youtubeTitleScaleFactor:CGFloat = 0.04
    let youtubeDescriptionScaleFactor: CGFloat = 0.03
    
    var imageWidth: CGFloat {
        size.width/2
    }
    var imageHeight: CGFloat {
        size.height/3
    }
}

struct YoutubeStreamerView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeStreamerView(OTVViewModel())
    }
}
