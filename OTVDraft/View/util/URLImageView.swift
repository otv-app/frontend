//
//  URLImageView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 5/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

/// a struct that implements `View`. This struct represents an `Image` loaded from a URL.
struct URLImageView: View {
    
    /// an `ObservedObject` that will redraw this `View` if this object changes. Is an `URLImageModel` that loads the image.
    @ObservedObject var urlImageModel: URLImageModel
    /// width of the image
    let width: CGFloat
    /// height of the image
    let height: CGFloat
    
    /**
     Creates a `URLImageView` struct.
     
     - Parameters:
        - urlString: the url string of the image
        - width: width of the image
        - height: height of the image
     */
    init (urlString: String, width: CGFloat, height: CGFloat) {
        urlImageModel = URLImageModel(urlString: urlString)
        self.width = width
        self.height = height
    }
    
    /**
     Creates the body this `URLImageView`. Loads an image from a url, else displays a default image.
     
     - Returns: some `View` that represents an image loaded from a url.
     */
    var body: some View {
        Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
    
    /// a default image that this `View` displays when url doesn't load.
    static var defaultImage = UIImage(named: "YoutubeDefault")
}
