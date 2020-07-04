//
//  YoutubeHomeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeHomeView: View {
    var body: some View {
        URLImageView(urlString: "http://img.youtube.com/vi/AziAmG7o_zU/0.jpg")
    }
}

struct YoutubeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeHomeView()
    }
}
