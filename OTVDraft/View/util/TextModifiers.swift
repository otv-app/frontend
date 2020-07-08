//
//  TextModifiers.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 7/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation
import SwiftUI

/// an extension of `Text` struct containing helper functions in this app
extension Text {
    /**
     This function transforms a `Text` into a title format by applying the appropriate `ViewModifier`s.
     
     - Parameters:
     - fontScaleFactor: a scale factor that scales a view's container to font size
     - size: the parent view container's size
     - color: the color of the text
     
     - Returns: a `Text` after applying `ViewModifier`s
     
     */
    func toYoutubeLogo(fontScaleFactor: CGFloat, size: CGFloat, color: Color) -> Text {
        self
            .fontWeight(.bold)
            .font(.custom("KenyanCoffee", size: size * fontScaleFactor))
            .foregroundColor(color)
    }
    
    func toYoutubeTitle(fontScaleFactor: CGFloat, size: CGSize, color: Color) -> some View {
        self
            .font(.system(size: size.height * fontScaleFactor))
            .foregroundColor(color)
            .lineLimit(1)
    }
    
    func toYoutubeDescription(fontScaleFactor: CGFloat, size: CGSize, color: Color) -> some View {
        self
            .font(.system(size: size.height * fontScaleFactor))
            .foregroundColor(color)
            .lineLimit(1)
    }
}
