//
//  YoutubeView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct YoutubeView: View {
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            Image("youtube")
        }
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView()
    }
}
