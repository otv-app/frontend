//
//  OTVView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct OTVView: View {
    /// An `ObservedObject` that will redraw this `View` if tab pages changes.
    @ObservedObject var viewRouter: ViewRouter
    /// An `ObservedObject` that will redraw this `View` if the view model changes.
    @ObservedObject var viewModel: OTVViewModel
    
    /**
     Creates an `OTVView` struct.
     
     - Parameters:
        - viewRouter: a given `ViewRouter` that tracks the current tab bar
        - viewModel: a given `OTVViewModel`
     */
    init(_ viewRouter: ViewRouter, _ viewModel: OTVViewModel) {
        self.viewRouter = viewRouter
        self.viewModel = viewModel
    }
    
    /**
     The body for this `View`. Displays the appropriate view for the current tab and puts a `CustomTabBarView` at the bottom.
     */
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                self.getPageView()
                Spacer()
                CustomTabBarView(self.viewRouter, geometry: geometry)
            }
        }
    }
    
    /**
     Gets the appropriate `View` for the current tab. Returns an `AnyView` as `ViewBuilder` does not allow control flow.
     
     - Returns: the appropriate view for the current tab.
     */
    func getPageView() -> AnyView {
        switch self.viewRouter.currentView {
            case TabBarPage.twitch: return AnyView(TwitchView())
            case TabBarPage.youtube: return AnyView(YoutubeView(self.viewModel))
            case TabBarPage.home: return AnyView(HomeView())
            case TabBarPage.twitter: return AnyView(TwitterView())
            case TabBarPage.merch: return AnyView(MerchView(self.viewModel))
        }
    }
}

struct OTVView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
