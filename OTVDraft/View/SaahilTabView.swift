//
//  CustomTabsView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct SaahilTabView: View {
    @ObservedObject var viewRouter: ViewRouter
    var size: CGSize
    
    init(_ viewRouter: ViewRouter, size: CGSize) {
        self.viewRouter = viewRouter
        self.size = size
    }
    
    var body : some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
                .frame(height: size.height/10)
            
            HStack {
                
                Button(action: {
                    
                }) {
                    Image("twitch")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width/3, height: size.height/10)
                        .foregroundColor(self.viewRouter.currentView == .twitch ? .purple : .white)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("youtube")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width/3, height: size.height/10)
                        .foregroundColor(self.viewRouter.currentView == .youtube ? .red : .white)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("home")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width/3, height: size.height/10)
                        .foregroundColor(self.viewRouter.currentView == .home ? .yellow : .white)
                }
                
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("twitter")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width/3, height: size.height/10)
                        .foregroundColor(self.viewRouter.currentView == .twitter ? .blue : .white)
                }
                
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("tshirt")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width/3, height: size.height/10)
                        .foregroundColor(self.viewRouter.currentView == .merch ? self.merchFocusColor : .white)
                    
                }
                
            }
            .padding(.horizontal, 35)
        }
    }
    
    // MARK: - Drawing Constants
    let merchFocusColor: Color = Color(red: 255/55, green: 113/255, blue: 181/255)
}

