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
                VStack (alignment: .center) {
                    ForEach(viewModel.getLatestVideos(latest: 10)) { video in
                        YoutubeVidView(vid: video, size: size)
                    }
                }
                .navigationBarTitle("Latest Videos")
                
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
