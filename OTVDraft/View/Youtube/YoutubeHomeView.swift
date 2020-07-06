//
//  YoutubeHomeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeHomeView: View {
    @ObservedObject var viewModel: OTVViewModel
    
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    //pass the geometryproxy size into a helper function to make the view
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    //we have a helper for the body function so we don't have to explicitly declare self
    //for variables in here
    private func body(for size: CGSize) -> some View {
        NavigationView {
            List {
                ForEach(viewModel.getLatestVideos(latest: 10)) { video in
                    YoutubeVidCard(size: size, youtubeVid: video)
                }
                //in order to hide the navigation bar u need to make a title so this wont show up
                .navigationBarTitle("youtube")
                .navigationBarHidden(true)
                
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
