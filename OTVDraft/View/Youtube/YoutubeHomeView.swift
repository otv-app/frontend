//
//  YoutubeHomeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

/// This struct is a `View` that represents the content for the home tab of the youtube view. The view should display the latest ten videos from all streamers on this app.
struct YoutubeHomeView: View {
    /// an `ObservedObject` view model so when the model changes, this view will be redrawn. Also provides access to the model.
    @ObservedObject var viewModel: OTVViewModel
    
    /**
     Creates a `YoutubeHomeView` struct and also hides the verticla scroll indicator.
     */
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    //pass the geometryproxy size into a helper function to make the view
    /**
     Creates the body for this view. Uses a `NavigationView` to display the youtube videos.
     
     - Returns: some `View` that represents the body of this view.
     */
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    //we have a helper for the body function so we don't have to explicitly declare self
    //for variables in here
    /**
     A helper function to create the body to avoid explicitly stating `self` for the variables in this body.
     
     - Parameter size: the size of the parent view container.
     
     - Returns: some `View` that represents the body of this `View`.
     */
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

/// A struct that implements a `View`protocol. This struct represents a single Youtube video component `View` that displays the youtube video thumbnail and its relevant information.
struct YoutubeVidCard: View {
    /// the size of the parent container view.
    var size: CGSize
    
    //should this variable be passed in? this is part of the model so idk if this is good design
    /// a `YoutubeVideo` that holds a youtube video's information
    var youtubeVid: YoutubeVideo
    
    /**
     Creates the body for this `View`. Should display a thumbnail and the youtube video's relevant information.
     */
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
