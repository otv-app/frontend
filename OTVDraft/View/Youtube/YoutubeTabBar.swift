//
//  YoutubeTabBar.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeTabBar: View {
    //keep track of current tab page
    @Binding var tab: YoutubeTab
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            Color.red
                .frame(width: geometry.size.width, height: geometry.size.height/5)
            VStack (spacing: 0) {
                Text("Youtube")
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                HStack (spacing: 0) {
                    YoutubeIcon(iconImageString: "home", tab: YoutubeTab.home)
                    YoutubeIcon(iconImageString: "twitter", tab: YoutubeTab.byStreamer)
                    YoutubeIcon(iconImageString: "youtube", tab: YoutubeTab.showAll)
                }
            }
        }
    }
    
    private func YoutubeIcon(iconImageString: String, tab: YoutubeTab) -> some View {
        VStack (spacing: 0) {
            Image(iconImageString)
                .renderingMode(.template)
                .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/10)
                .foregroundColor(self.tab == tab ? .white : .black)
                .onTapGesture {
                    self.tab = tab
            }
            Rectangle().size(width: geometry.size.width/numberOfIcons, height: youtubeIconBarHeight)
                .foregroundColor(self.tab == tab ? .white : .red)
        }
        .frame(width: geometry.size.width/numberOfIcons, height: geometry.size.height/10 + youtubeIconBarHeight)
    }
    
    // MARK: - Drawing Constants
    let numberOfIcons: CGFloat = 3
    let youtubeIconBarHeight: CGFloat = 3
}

public enum YoutubeTab {
    case home
    case byStreamer
    case showAll
}
