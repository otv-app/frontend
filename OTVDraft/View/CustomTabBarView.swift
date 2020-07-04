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
    
    init(_ viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        GeometryReader { geometry in
            //each image uses a ViewModifier to modify the icon
            HStack {
                Image("youtube")
                    .renderingMode(.template)
                    .resizable().toIcon(geometry: geometry, icons: 5)
                    .foregroundColor(self.viewRouter.currentView == .youtube ? .red : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.youtube
                }
                Image("twitter")
                    .renderingMode(.template)
                    .resizable().toIcon(geometry: geometry, icons: 5)
                    .foregroundColor(self.viewRouter.currentView == .twitter ? .blue : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.twitter
                }
                ZStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width:75, height: 75)
                    Image("home").resizable().toIcon(geometry: geometry, icons: 5).onTapGesture {
                        self.viewRouter.currentView = TabBarPage.home
                    }
                }
                Image("tshirt")
                    .renderingMode(.template)
                    .resizable().toIcon(geometry: geometry, icons: 5)
                    .foregroundColor(self.viewRouter.currentView == .merch ? self.merchFocusColor : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.merch
                }
                Image("twitch")
                    .renderingMode(.template)
                    .resizable().toIcon(geometry: geometry, icons: 5)
                    .foregroundColor(self.viewRouter.currentView == .twitch ? .purple : .white)
                    .onTapGesture {
                        self.viewRouter.currentView = TabBarPage.twitch
                }
            }
        }
    }
    
    // MARK: - Drawing Constants
    let merchFocusColor: Color = Color(red: 255/55, green: 113/255, blue: 181/255)
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(ViewRouter())
    }
}
