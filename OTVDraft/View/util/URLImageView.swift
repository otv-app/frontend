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
    /// clip shape of the image, 0 for circle and 1 for rect
    // fix this later cuz this is garbage code
    let cShape: Int
    
    /**
     Creates a `URLImageView` struct.
     
     - Parameters:
        - urlString: the url string of the image
        - width: width of the image
        - height: height of the image
     */
    init (urlString: String, width: CGFloat, height: CGFloat, cShape: Int) {
        urlImageModel = URLImageModel(urlString: urlString)
        self.width = width
        self.height = height
        self.cShape = cShape
    }
    
    /**
     Creates the body this `URLImageView`. Loads an image from a url, else displays a default image.
     
     - Returns: some `View` that represents an image loaded from a url.
     */
    var body: some View {
//        Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
//            .resizable()
//            .scaledToFit()
//            .frame(width: width, height: height)
        ZStack {
            if self.cShape == 0 {
                Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .clipShape(Circle())
            } else {
                Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(16/9, contentMode: .fit)
//                    .scaledToFit()
                    .frame(width: width, height: height)
            }
        }
    }
    
    /// a default image that this `View` displays when url doesn't load.
    static var defaultImage = UIImage(named: "QuestionMark")
}
