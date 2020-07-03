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

//this viewrouter is an observableObject which means it can be observed with a @ObservedObject tag.
//this viewRouter is placed inside a View struct, and when a @Published changes, it will call
//objectWillChange.send() in an objservedObject which will then redraw the view
//used a class for this ViewRouter as I wanted this to be a reference not a value
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
