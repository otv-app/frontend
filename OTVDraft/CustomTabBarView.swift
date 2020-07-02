//
//  CustomTabBarView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct CustomTabBarView: View {
    
    var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        GeometryReader { geometry in
            //each image uses a ViewModifier to modify the icon
            HStack {
                Image("home").resizable().iconify(geometry: geometry).onTapGesture {
                    self.viewRouter.currentView = TabBarPage.home
                }
                Image("youtube").resizable().iconify(geometry: geometry).onTapGesture {
                    self.viewRouter.currentView = TabBarPage.youtube
                }
                Image("twitter").resizable().iconify(geometry: geometry).onTapGesture {
                    self.viewRouter.currentView = TabBarPage.twitter
                }
                Image("tshirt").resizable().iconify(geometry: geometry).onTapGesture {
                    self.viewRouter.currentView = TabBarPage.merch
                }
                Image("twitch").resizable().iconify(geometry: geometry).onTapGesture {
                    self.viewRouter.currentView = TabBarPage.twitch
                }
            }
        }
    }
}

//a viewmodifer performing the neccesary modifications to a Content
struct IconView: ViewModifier {
    var geometry: GeometryProxy
    
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: ContentMode.fit)
            .padding(20)
            .scaledToFit()
            .frame(width: geometry.size.width/self.numberOfIcons, height: self.iconFrameHeight)
    }
    
    // MARK: - Drawing Constants
    private let numberOfIcons: CGFloat = 5
    private let iconFrameHeight: CGFloat = 75
}

//extension of image to call the ViewModifier directly
extension Image {
    func iconify(geometry: GeometryProxy) -> some View {
        self.modifier(IconView(geometry: geometry))
    }
}
