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

class ViewRouter: ObservableObject {
    
    //published tag notifies all ObservableObject to update when this is changed
    @Published var currentView = TabBarPage.home
}

public enum TabBarPage {
    case twitch
    case twitter
    case merch
    case home
    case youtube
}
