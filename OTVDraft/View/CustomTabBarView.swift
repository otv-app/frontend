//
//  CustomTabBarView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

/// a struct that implements a `View` that represent a custom tab bar for switching between different pages of this app.
struct CustomTabBarView: View {
    ///an `ObservedObject` that will redraw this view if the current tab changes.
    @ObservedObject var viewRouter: ViewRouter
    ///the `GeometryProxy` of the parent view container.
    var geometry: GeometryProxy
    
    /**
     Creates a `CustomTabBarView` struct.
     
     - Parameters:
        - viewRouter: a given `ViewRouter` to track current tab
        - geometry: the parent view container
     */
    init(_ viewRouter: ViewRouter, geometry: GeometryProxy) {
        self.viewRouter = viewRouter
        self.geometry = geometry
    }
    
    /// The body of this custom tab bar that displays the icons for each pages of this app.
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
                .frame(width: geometry.size.width, height: geometry.size.height/8)
            HStack {
                TabBarIcon(iconImageString: "home", tab: .home, focusColor: .yellow)
                TabBarIcon(iconImageString: "youtube", tab: .youtube, focusColor: .red)
                TabBarIcon(iconImageString: "twitter", tab: .twitter, focusColor: .blue)
                TabBarIcon(iconImageString: "twitch", tab: .twitch, focusColor: .purple)
                TabBarIcon(iconImageString: "tshirt", tab: .merch, focusColor: merchFocusColor)
            }
            .padding(.horizontal, 35)
        }
    }
    
    /**
     helper function that creates an icon for the tab bar
     
     - Parameters:
        - iconImageString: a given string url of an image
        - tab: the tab page this icon is associated with
        - focusColor: the color of the icon when the page is in focus.
     
     - Returns: some `View` that represents the body for an icon on the tab bar.
     */
    private func TabBarIcon(iconImageString: String, tab: TabBarPage, focusColor: Color) -> some View {
        Image(iconImageString)
            .renderingMode(.template)
            .resizable().toIcon(width: iconWidth, height: iconHeight)
            .foregroundColor(self.viewRouter.currentView == tab ? focusColor : .white)
            .onTapGesture {
                self.viewRouter.currentView = tab
        }
    }
    
    // MARK: - Drawing Constants
    let merchFocusColor: Color = Color(red: 255/55, green: 113/255, blue: 181/255)
    let numberOfIcons: CGFloat = 5
    var iconWidth: CGFloat {
        geometry.size.width/numberOfIcons
    }
    var iconHeight: CGFloat {
        geometry.size.height/8
    }
}
