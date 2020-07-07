//
//  ViewRouter.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

/** This class implements an `ObservableObject` protocol which will redraw the view at this `ViewRouter` is in when a change is indicated by the `Published` object. `ViewRouter` needs to be a reference type so it can be passed into the appropriate `View`s
 */
class ViewRouter: ObservableObject {
    
    /// a currentView that holds the current tab that the tab bar is on.
    @Published var currentView = TabBarPage.home
}

/// an enum of the tab bar pages
public enum TabBarPage {
    case twitch
    case twitter
    case merch
    case home
    case youtube
}
