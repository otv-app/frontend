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
    func toTitle(fontScaleFactor: CGFloat, size: CGFloat, color: Color) -> Text {
        self
            .fontWeight(.bold)
            .font(.system(size: size * fontScaleFactor))
            .foregroundColor(color)
    }
}
