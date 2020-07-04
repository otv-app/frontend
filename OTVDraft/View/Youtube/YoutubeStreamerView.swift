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
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        NavigationView {
            List {
                ForEach(viewModel.getLatestVideos(latest: 10)) { video in
                    YoutubeVidCard(size: size, youtubeVid: video)
                }
                
            }.onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct YoutubeVidCard: View {
    var size: CGSize
    var youtubeVid: YoutubeVideo
    
    var body: some View {
        VStack {
            URLImageView(urlString: youtubeVid.thumbnailURL, width: size.width/2, height: size.height/3)
            Text(youtubeVid.title)
            HStack {
                Text(youtubeVid.channelName)
                Text("\(youtubeVid.views)")
                Text(youtubeVid.rawDuration)
            }
        }
        .frame(width: size.width)
    }
}
