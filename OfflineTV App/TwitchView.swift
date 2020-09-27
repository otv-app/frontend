//
//  TwitchView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct TwitchView: View {
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            Image("twitch")
        }

    }
}

struct TwitchView_Previews: PreviewProvider {
    static var previews: some View {
        TwitchView()
    }
}
