//
//  URLImageView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 5/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    //this view is redrawn when objectWillChange.send() is called, basically when the image is done loading.
    @ObservedObject var urlImageModel: URLImageModel
    let width: CGFloat
    let height: CGFloat
    
    init (urlString: String, width: CGFloat, height: CGFloat) {
        urlImageModel = URLImageModel(urlString: urlString)
        self.width = width
        self.height = height
    }
    
    //image is the default one unless urlImageModel.image is not nil
    var body: some View {
        Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
    
    //i need to find a better default image than this lol
    static var defaultImage = UIImage(named: "YoutubeDefault")
}
