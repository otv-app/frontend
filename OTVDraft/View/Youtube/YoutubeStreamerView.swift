//
//  YoutubeStreamerView.swift
//  OTVDraft
//
//  Created by Cheng Xi Tsou on 4/7/2020.
//  Copyright © 2020 Cheng Xi Tsou. All rights reserved.
//

import SwiftUI

struct YoutubeStreamerView: View {
    
    @ObservedObject var viewModel: OTVViewModel
    
    @Binding var showFullTab: Bool
    
    @GestureState private var dragOffset = CGSize.zero
    
    init(_ viewModel: OTVViewModel, showFullTab: Binding<Bool>) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
        self._showFullTab = showFullTab
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        NavigationView {
            List {
                ForEach(viewModel.streamers) {
                    streamer in YoutubeRowView(streamer: streamer, size: size, showFullTab: self.$showFullTab)
                }
            }
            .simultaneousGesture(DragGesture()
                       .updating($dragOffset, body: { (value, state, transaction) in
                        
                                               state = value.translation
                                           })
                .onChanged({ _ in
//                    if self.dragOffset.height > 0 {
//                        self.showFullTab = true
//                    } else {
//                        self.showFullTab = false
//                    }
                    print(self.dragOffset.height)
                })
                )
            .navigationBarTitle(Text("By Channel"))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
//            .navigationViewStyle(StackNavigationViewStyle())
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct YoutubeRowView: View {

    var streamer: OTVStreamer
    
    var size: CGSize
    
    @Binding var showFullTab: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
//                URLImageView(urlString: streamer.youtubeChannel.pfpURL, width: pfpWidth, height: pfpHeight, cShape: 0)
                Text(streamer.name).font(.system(size: size.height * youtubeChannelNameScaleFactor)).fontWeight(.semibold)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(streamer.youtubeVideos) {
                        item in
                            YoutubeVidView(vid: item, size: self.size, w: self.imageWidth, h: self.imageHeight, titleScaleFactor: self.youtubeTitleScaleFactor, descScaleFactor: self.youtubeDescriptionScaleFactor).padding(5)
                    }
                }
            }
        }
    }
    
    // MARK: - Drawing Constants
    let youtubeChannelNameScaleFactor: CGFloat = 0.05
    var imageWidth: CGFloat {
        size.width/2
    }
    var imageHeight: CGFloat {
        size.height/3
    }
    var pfpWidth: CGFloat {
        size.width / 5
    }
    var pfpHeight: CGFloat {
        size.height / 5
    }
    let youtubeTitleScaleFactor: CGFloat = 0.04
    let youtubeDescriptionScaleFactor: CGFloat = 0.03
}

struct YoutubeVidView: View {
    
    var vid: YoutubeVideo
    
    var size: CGSize
    
    // MARK: - Drawing Constants
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var youtubeTitleScaleFactor: CGFloat
    var youtubeDescriptionScaleFactor: CGFloat
    
    init(vid: YoutubeVideo, size: CGSize, w imageWidth: CGFloat, h imageHeight: CGFloat, titleScaleFactor youtubeTitleScaleFactor: CGFloat, descScaleFactor youtubeDescriptionScaleFactor: CGFloat) {
        self.vid = vid
        self.size = size
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.youtubeTitleScaleFactor = youtubeTitleScaleFactor
        self.youtubeDescriptionScaleFactor = youtubeDescriptionScaleFactor
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            URLImageView(urlString: vid.thumbnailURL, width: imageWidth, height: imageHeight, cShape: 1)
            
            VStack (alignment: .leading) {
                Text(vid.title)
                    .toYoutubeTitle(fontScaleFactor: youtubeTitleScaleFactor, size: size, color: .black)
                    .frame(width: imageWidth, alignment: .leading)
                    
//                Text("\(vid.views) views • \(vid.rawDate)")
//                    .toYoutubeDescription(fontScaleFactor: youtubeDescriptionScaleFactor, size: size, color: .gray)
            }
        }
    }
}

struct YoutubeStreamerView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeStreamerView(OTVViewModel(), showFullTab: Binding.constant(true))
    }
}
