//
//  YoutubeView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 2/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeView: View {
    @ObservedObject var viewModel: OTVViewModel
    @State var tab: YoutubeTab = YoutubeTab.home
    
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                YoutubeTabBar(tab: self.$tab, geometry: geometry)
                Spacer()
                self.getYoutubeTabView()
            }
        }
    }
    
    private func getYoutubeTabView() -> AnyView {
        switch self.tab {
        case YoutubeTab.home: return AnyView(YoutubeHomeView(self.viewModel))
        case YoutubeTab.byStreamer: return AnyView(YoutubeStreamerView(self.viewModel))
            case YoutubeTab.showAll: return AnyView(YoutubeAllView())
        }
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView(OTVViewModel())
    }
}
