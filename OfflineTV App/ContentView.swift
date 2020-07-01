//
//  ContentView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/12/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 2

    var body: some View {
        VStack (spacing: 0){
            
            ZStack {
                if self.index == 0 {
                    TwitchView()
                }
                else if self.index == 1 {
                    YoutubeView()
                }
                else if self.index == 2 {
                    HomeView()
                }
                else if self.index == 3 {
                    TwitterView()
                }
                else {
                    MerchView()
                }
            }

            CustomTabsView(index: $index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
