//
//  URLImageModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 5/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI
import Foundation

/**
This class is a model used for converting an image's url to an `UIImage`. The class implements an `ObservableObject` protocol so that the model can inform a View to be redrawn when a `Published` object indificates a change.
 */
class URLImageModel: ObservableObject {
    /// An `Optional<UIImage>` to store a loaded image
    @Published var image: UIImage?
    /// A `String` for an image's url
    private var urlString: String
    
    /**
     Creates an `URLImageModel` object and attempts to load an image from the image's url
     
     - Parameter urlString: an image's url
     */
    init(urlString: String) {
        self.urlString = urlString
        self.loadImage()
    }
    
    ///The function attempts to load an image
    func loadImage() {
        loadImageFromURL()
    }
    
    ///The function attemps to load an image from a string url. Uses an `URLSession` to load an image async
    private func loadImageFromURL() {
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    /**
     The function pushes the task of loading the image to main thread async and will intialize the `Optional<UIImage>` if sucessful. Otherwise, the process is stopped.
     
     - Parameters:
        - data: data received from the URL
        - response:the response from `URLSession` required by a completionhandler.
        - error: an error returned by this task
     
     
     */
    private func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        //if error is not nil, the else will be called, which exits the function
        guard error == nil else {
            return
        }
        
        //initialize data, if data is nil, then exit function
        guard let data = data else {
            return
        }
        
        //load image with data, if not then exit function
        //pushes task to main thread so slow internet doesn't mean program is turbostuck here like saahil turbostuck in iron
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            //at this point the image must be loaded, so assign image variable to the loadedImage
            self.image = loadedImage
        }
        
    }
}
