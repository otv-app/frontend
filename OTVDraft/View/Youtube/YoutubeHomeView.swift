//
//  YoutubeHomeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeHomeView: View {
    @ObservedObject var viewModel: OTVViewModel
    
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Youtube Home")
    }
}
