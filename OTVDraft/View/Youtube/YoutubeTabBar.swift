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
    
    var body: some View {
        GeometryReader { geometry in
            return HStack {
                VStack {
                    Image("home")
                        .renderingMode(.template)
                        .resizable().toIcon(geometry: geometry, icons: 3)
                        .foregroundColor(self.tab == YoutubeTab.home ? .white : .black)
                        .onTapGesture {
                            self.tab = YoutubeTab.home
                        }
                    //the offset here should be scaled to size
                    Rectangle().size(width: geometry.size.width/3, height: 5).offset(x: 0, y: -geometry.size.height/4).foregroundColor(self.tab == YoutubeTab.home ? .white : .red)
                }
                VStack {
                    Image("twitter")
                        .renderingMode(.template)
                        .resizable().toIcon(geometry: geometry, icons: 3)
                        .foregroundColor(self.tab == YoutubeTab.byStreamer ? .white : .black)
                        .onTapGesture {
                            self.tab = YoutubeTab.byStreamer
                        }
                    //the offset here should be scaled to size
                    Rectangle().size(width: geometry.size.width/3, height: 5).offset(x: 0, y: -geometry.size.height/4).foregroundColor(self.tab == YoutubeTab.byStreamer ? .white : .red)
                }
                VStack {
                    Image("youtube")
                        .renderingMode(.template)
                        .resizable().toIcon(geometry: geometry, icons: 3)
                        .foregroundColor(self.tab == YoutubeTab.showAll ? .white : .black)
                        .onTapGesture {
                            self.tab = YoutubeTab.showAll
                        }
                    //the offset here should be scaled to size
                    Rectangle().size(width: geometry.size.width/3, height: 5).offset(x: 0, y: -geometry.size.height/4).foregroundColor(self.tab == YoutubeTab.showAll ? .white : .red)
                }
            }
        }
    }
}

public enum YoutubeTab {
    case home
    case byStreamer
    case showAll
}
