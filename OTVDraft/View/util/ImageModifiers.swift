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
    var geometry: GeometryProxy
    
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: ContentMode.fit)
            .padding(20)
            .scaledToFit()
            .frame(width: geometry.size.width/self.numberOfIcons, height: self.iconFrameHeight)
    }
    
    // MARK: - Drawing Constants
    private let numberOfIcons: CGFloat = 5
    private let iconFrameHeight: CGFloat = 75
}

//extension of image to call the ViewModifier directly
extension Image {
    func toIcon(geometry: GeometryProxy) -> some View {
        self.modifier(IconView(geometry: geometry))
    }
    
    //lol imma do this later
    func toMerchImage() -> some View {
        self
    }
}
