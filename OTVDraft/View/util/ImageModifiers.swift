//
//  ImageModifiers.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 3/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation
import SwiftUI

/// A struct that implements a `ViewModifier` protocol used to modify a content into an icon.
struct IconView: ViewModifier {
    /// the width of the icon
    var width: CGFloat
    /// the height of the icon
    var height: CGFloat

    /**
     Creates a body for this `View`. Takes in the content and applies appropriate `ViewModifier` to the content to make an icon.
     
     - Parameter content: a given content
     
     - Returns: some `View` after applying `ViewModifier`s
     */
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: ContentMode.fit)
            .padding(15)
            .scaledToFit()
            .frame(width: width, height: height)
    }
}

/// An extension of `Image` that contains helper functions for this app
extension Image {
    
    /**
     This is a helper function that transforms an `Image` to an `IconView`.
     
     - Parameters:
        - width: the width of the image
        - height: the height of the image
     
     - Returns: some `View` that represents the body of an Icon.
     */
    func toIcon(width: CGFloat, height: CGFloat) -> some View {
        self.modifier(IconView(width: width, height: height))
    }
    
    func toMerchImage() -> some View {
        self
    }
}
