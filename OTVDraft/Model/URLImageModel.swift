//
//  URLImageModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 5/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI
import Foundation

class URLImageModel: ObservableObject {
    //when this image changes, so basically when the image loads, objectWillChange.send() is called whereever this ObservableObject is
    @Published var image: UIImage?
    //I assume every youtube video or image url is not nil, so this isn't optional. I can guard agaisnt Optionals if need be
    var urlString: String
    
    //image is initialized after this object is created
    init(urlString: String) {
        self.urlString = urlString
        self.loadImage()
    }
    
    //calls loadImageFromURL()
    func loadImage() {
        loadImageFromURL()
    }
    
    
    func loadImageFromURL() {
        //converts the string url into an URL object
        let url = URL(string: urlString)
        
        //lets this task run async with current thread so program isnt' turbostuck
        let task = URLSession.shared.dataTask(with: url!, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
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
