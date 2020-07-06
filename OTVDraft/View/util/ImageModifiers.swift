//
//  ImageModifiers.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 3/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation
import SwiftUI

//a viewmodifer performing the neccesary modifications to a Content
//takes in any some View and turns it into an icon
struct IconView: ViewModifier {
    var width: CGFloat
    var height: CGFloat

    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: ContentMode.fit)
            .padding(15)
            .scaledToFit()
            .frame(width: width, height: height)
    }
}

//extension of image to call the ViewModifier directly
extension Image {
    func toIcon(width: CGFloat, height: CGFloat) -> some View {
        self.modifier(IconView(width: width, height: height))
    }
    
    //lol imma do this later
    func toMerchImage() -> some View {
        self
    }
}
