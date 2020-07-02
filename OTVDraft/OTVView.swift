//
//  OTVView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct OTVView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
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
    
    func getPageView() -> AnyView {
        let currentPage: TabBarPage = self.viewRouter.currentView
        switch currentPage {
            case TabBarPage.twitch: return AnyView(TwitchView())
            case TabBarPage.youtube: return AnyView(YoutubeView())
            case TabBarPage.home: return AnyView(HomeView())
            case TabBarPage.twitter: return AnyView(TwitterView())
            case TabBarPage.merch: return AnyView(MerchView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OTVView(ViewRouter())
    }
}
