//
//  OTVModel.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 3/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import Foundation

//this is named OTVModel but prob should just be named StreamerModel but this takes in a generic type with protocol Streamer
struct OTVModel<StreamerType> where StreamerType: Streamer {
    //read only streamers array so viewmodel can get it
    private(set) var streamers: Array<StreamerType>
    
    //since the app doesn't need the user to change the model, theres no need for callback functions
    //the only intent functions here are prob getters
    //we could make view read directly from model if all variables in model are read-only but idk if its good design
    
}
