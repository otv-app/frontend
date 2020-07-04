//
//  OTVView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct OTVView: View {
    //this is an observedObject so when objectWillChange.send() is called when @Published changes,
    //this will redraw the view. This happens when currentView changes which keeps track of what
    //tab we are on, and also happens when model changes like maybe when a new youtube video is
    //out or something and view will be redrawn
    //we can use @State for the currentView keeping track of tabs, ObservedObject is basically
    //keeping track of a state but with complex data so instead of a string or int
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: OTVViewModel
    
    init(_ viewRouter: ViewRouter, _ viewModel: OTVViewModel) {
        self.viewRouter = viewRouter
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                self.getPageView()
                Spacer()
                CustomTabBarView(self.viewRouter)
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color.black.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    //swiftui is new and sucks so it doesn't allow control flow in @ViewBuilders so I needa
    //cast these views into AnyView
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
