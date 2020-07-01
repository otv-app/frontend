//
//  CustomTabsView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct CustomTabsView: View {
    @Binding var index: Int
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body : some View {
            
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
                .frame(height: CGFloat(self.getTabSize() * 2))
            
            
            HStack {
                
                Button(action: {
                    self.index = 0
                }) {
                    Image("twitch")
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                }.foregroundColor(self.index == 0 ? Color.purple : Color.white)
                
                Spacer()
                
                Button(action: {
                    self.index = 1
                }) {
                    Image("youtube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                }.foregroundColor(self.index == 1 ? Color.red : Color.white)
                
                Spacer()
                
                Button(action: {
                    self.index = 2
                }) {
                    Image("home")
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                }.foregroundColor(self.index == 2 ? Color.green : Color.white)
                
                Spacer()
                
                Button(action: {
                    self.index = 3
                }) {
                    Image("twitter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                }.foregroundColor(self.index == 3 ? Color.blue : Color.white)
                
                Spacer()
                
                Button(action: {
                    self.index = 4
                }) {
                    Image("tshirt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat( self.getTabSize()), height: CGFloat(self.getTabSize()))
                }.foregroundColor(self.index == 4 ? Color(red: 255/55, green: 113/255, blue: 181/255) : Color.white)
                
            }
            .padding(.horizontal, 35)
        }
    }
    
    func getTabSize() -> Float {
        if sizeClass == .compact {
            return 30
        }
        else {
            return 60
        }
    }
}

struct CustomTabsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabsView(index: Binding.constant(0))
    }
}
