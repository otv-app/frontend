//
//  YoutubeTabBar.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

/// This struct implements a `View` protocol and is the youtube tab bar on the youtube view page.
struct YoutubeTabBar: View {
    /// This `Binding<YoutubeTab>` keeps track of the current tab that the tab bar is on using the `YoutubeTab` enum.
    @Binding var tab: YoutubeTab
    
    @Binding var showFullTab: Bool
    /// This variable is passed in from the parent youtube view as a reference to the parent container size.
    var geometry: GeometryProxy
    
    /**
     Creates the body for this `View`. Contains a title and the tab bar with a red background.
     */
    var body: some View {
        ZStack {
            Color.red
//                .frame(width: geometry.size.width, height: geometry.size.height/4)
            VStack (spacing: 0) {
                //the size used for scaling is the view's height since we aren't supporting landscape view so it makes more sense to
                //scale according to the portrait dimension
                //the padding and frame are called outside the dimension as those are not really part of the text, but the frame
                Spacer()
                Spacer()
                Text("Youtube").toYoutubeLogo(fontScaleFactor: youtubeTitleScaleFactor, size: geometry.size.height, color: .white)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height/10, alignment: .leading)
                Spacer()
                HStack (spacing: 0) {
                    YoutubeIcon(iconImageString: "home", tab: YoutubeTab.home)
                    YoutubeIcon(iconImageString: "twitter", tab: YoutubeTab.byStreamer)
//                    YoutubeIcon(iconImageString: "youtube", tab: YoutubeTab.showAll)
                }
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height/4)
        .shadow(radius: shadowRadius)
//        .background(Color.red)
//        VStack (spacing: 0) {
//                //the size used for scaling is the view's height since we aren't supporting landscape view so it makes more sense to
//                //scale according to the portrait dimension
//                //the padding and frame are called outside the dimension as those are not really part of the text, but the frame
//            ZStack {
//                    Color.red
//                            .frame(width: geometry.size.width, height: geometry.size.height/10)
//                    Text("Youtube").toYoutubeLogo(fontScaleFactor: youtubeTitleScaleFactor, size: geometry.size.height, color: .white)
//                        .padding()
//                        .frame(width: geometry.size.width, height: geometry.size.height/10, alignment: .leading)
//            }
//            ZStack {
//                Color.red
//                        .frame(width: geometry.size.width, height: geometry.size.height/10)
//                HStack (spacing: 0) {
//                    YoutubeIcon(iconImageString: "home", tab: YoutubeTab.home)
//                    YoutubeIcon(iconImageString: "twitter", tab: YoutubeTab.byStreamer)
//                    YoutubeIcon(iconImageString: "youtube", tab: YoutubeTab.showAll)
//                }
//            }
//        }
    }
    
    /**
     A helper function to help create a youtube icon on the youtube tab bar. Creates a button, adds an action, and an image.
     
     - Parameters:
     - iconImageString: the string reference to the icon image
     - tab: the `YoutubeTab` that this icon is associated wtih
     
     - Returns: some `View` that represents an icon on the youtube tab bar
     */
    private func YoutubeIcon(iconImageString: String, tab: YoutubeTab) -> some View {
        VStack (spacing: 0) {
            Button(action: {
                self.tab = tab
            }) {
                Image(iconImageString)
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/10)
                    .foregroundColor(self.tab == tab ? .white : .black)
            }
            Rectangle().size(width: geometry.size.width/numberOfIcons, height: youtubeIconBarHeight)
                .foregroundColor(self.tab == tab ? .white : .red)
        }
        .frame(width: geometry.size.width/numberOfIcons, height: geometry.size.height/10 + youtubeIconBarHeight)
    }
    
    // MARK: - Drawing Constants
    let numberOfIcons: CGFloat = 2
    let youtubeIconBarHeight: CGFloat = 3
    let youtubeTitleScaleFactor: CGFloat = 0.08
    let shadowRadius: CGFloat = 2
}

/// this is an enum for a tab on the youtube tab bar
public enum YoutubeTab {
    case home
    case byStreamer
    case showAll
}
