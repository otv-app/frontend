//
//  YoutubeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

/// This struct implements a `View` protocol and is one of the view tabs in this program. This page should feature youtube content from the streamers on this app.
struct YoutubeView: View {
    /// an `ObservedObject` view model so when the model changes, this view will be redrawn. Also provides access to the model.
    @ObservedObject private var viewModel: OTVViewModel
    /// a `State<YoutubeTab> ` to keep track of which tab this youtube page is on
    @State var tab: YoutubeTab = YoutubeTab.home
    
    /**
     Creates a `YoutubeView` object.
     */
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
    }
    /**
    The body of this view. This view should contain a custom tab bar on the top and the appropriate youtube content on the bottom.
     */
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                YoutubeTabBar(tab: self.$tab, geometry: geometry)
                Spacer()
                self.getYoutubeTabView()
            }
        }
    }
    
    /**
     This function gets the appropriate youtube content `View` to show according to which tab the youtube tab bar is on. The function returns an `AnyView` as control flow is not supported in a `ViewBuilder`.
     
     - Returns: an `AnyView` that is the youtube content according to the current tab.
     */
    private func getYoutubeTabView() -> AnyView {
        switch self.tab {
        case YoutubeTab.home: return AnyView(YoutubeHomeView(self.viewModel))
        case YoutubeTab.byStreamer: return AnyView(YoutubeStreamerView(self.viewModel))
            case YoutubeTab.showAll: return AnyView(YoutubeAllView())
        }
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView(OTVViewModel())
    }
}
