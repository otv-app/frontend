//
//  CustomTabsView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//
import SwiftUI

struct SaahilTabView: View {
    //@ObservedObject var viewRouter: ViewRouter
    
    init(_ viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.bottom)
                    .frame(height: geometry.size.height/10)
                
                
                HStack {
                    Image("twitch")
                            .renderingMode(.template)
                            .resizable().toIcon(geometry: geometry, icons: 5)
                            .foregroundColor(self.viewRouter.currentView == .youtube ? .red : .white)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("youtube")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("home")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("twitter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("tshirt")
                            .resizable()
                            .scaledToFit()
                            .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                    }
                    
                }
                .padding(.horizontal, 35)
            }
        }
    }
}
