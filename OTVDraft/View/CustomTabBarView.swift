//
//  CustomTabBarView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct CustomTabBarView: View {
    @ObservedObject var viewRouter: ViewRouter
    var geometry: GeometryProxy
    
    init(_ viewRouter: ViewRouter, geometry: GeometryProxy) {
        self.viewRouter = viewRouter
        self.geometry = geometry
    }
    
    var body: some View {
        //each image uses a ViewModifier to modify the icon
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
                .frame(width: geometry.size.width, height: geometry.size.height/8)
            HStack {
                Image("youtube")
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/8)
                    .foregroundColor(self.viewRouter.currentView == .youtube ? .red : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.youtube
                }
                Image("twitter")
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/8)
                    .foregroundColor(self.viewRouter.currentView == .twitter ? .blue : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.twitter
                }
                Image("home")
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/8)
                    .foregroundColor(self.viewRouter.currentView == .home ? .blue : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.home
                }
                Image("tshirt")
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/8)
                    .foregroundColor(self.viewRouter.currentView == .merch ? self.merchFocusColor : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.merch
                }
                Image("twitch")
                    .renderingMode(.template)
                    .resizable().toIcon(width: geometry.size.width/numberOfIcons, height: geometry.size.height/8)
                    .foregroundColor(self.viewRouter.currentView == .twitch ? .purple : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.twitch
                }
            }
            .padding(.horizontal, 35)
        }
    }
    
    // MARK: - Drawing Constants
    let merchFocusColor: Color = Color(red: 255/55, green: 113/255, blue: 181/255)
    let numberOfIcons: CGFloat = 5
}
