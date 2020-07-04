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
    var numberOfIcons: CGFloat
    
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: ContentMode.fit)
            .padding(20)
            .scaledToFit()
            .frame(width: geometry.size.width/self.numberOfIcons, height: geometry.size.height * iconFrameHeightMultiplier)
        
    }
    
    // MARK: - Drawing Constants
    private let iconFrameHeightMultiplier: CGFloat = 1.2
}

//extension of image to call the ViewModifier directly
extension Image {
    func toIcon(geometry: GeometryProxy, icons numberOfIcons: CGFloat) -> some View {
        self.modifier(IconView(geometry: geometry, numberOfIcons: numberOfIcons))
    }
    
    //lol imma do this later
    func toMerchImage() -> some View {
        self
    }
}
