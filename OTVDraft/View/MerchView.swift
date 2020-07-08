//
//  MerchView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//
import SwiftUI

/// This is a struct that implements the `View` protocol. Represents the `View` for the app's merch page.
struct MerchView: View {
    /// An `ObservedObject` that redraws this view if the view model changes.
    @ObservedObject var viewModel: OTVViewModel
    
    /**
     Creates a `MerchView`. Hides the vertical scroll indicator.
     
     - Parameter viewModel: a given view model.
     */
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    /**
     The body for the `View`. Displays the merch for all streamers and their price.
     */
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    /**
     a helper function that creates the body so that variables in the body don't have to explicitly state `self`. Puts the streamer merchs in rows sorted by streamer using `NavigationView`.
     
     - Returns: some `View` that represents the body for this `MerchView`.
     */
    
    private func body(for size: CGSize) -> some View {
        NavigationView {
            List {
                
                ForEach(viewModel.streamers) { streamer in
                    MerchRowView(streamer: streamer, size: size)
                }
                
            }.navigationBarTitle(Text("Merch"))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

/// a struct that represents a single row in this `MerchView`.
struct MerchRowView: View {
    
    /// the streamer that this row is for
    var streamer: OTVStreamer
    /// the size of the parent view container.
    var size: CGSize
    
    /// the body for a single row. Displays the streamer name and a `ScrollView` of their merchs.
    var body: some View {
        
        VStack (alignment: .leading) {
            Text(streamer.name).font(.system(size: size.height * merchStreamerNameScaleFactor)).fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(streamer.merch) { item in
                        MerchItemView(merch: item, size: self.size).padding(5)
                    }
                }
                
            }
        }
    }
    
    // MARK: - Drawing Constants
    let merchStreamerNameScaleFactor: CGFloat = 0.03
}

/// a struct that represents the `View` of a single merch item.
struct MerchItemView: View {
    
    /// the merch item to be displayed
    var merch: Merch
    /// the size of the parent container view.
    var size: CGSize
    
    /// The body for a single merch item. Creates an image of the merch, price, and clicking on the image will send you to the merch page.
    var body: some View {
        VStack {
            Button(action: {
                let url: NSURL = URL(string: self.merch.link)! as NSURL
                
                UIApplication.shared.open(url as URL)
            }) {
                Image(self.merch.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth, height: imageHeight)
                    .cornerRadius(self.cornerRadius)
            }.buttonStyle(PlainButtonStyle())
            
            Text("$" + String(self.merch.price)).font(.system(size: size.height * merchPriceScaleFactor))
        }
        .frame(width: size.width/2 * buttonSizeMultiplier, height: size.height/3 * buttonSizeMultiplier)
        .cornerRadius(self.cornerRadius)
        .shadow(radius: self.shadowRadius)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 2
    let shadowRadius: CGFloat = 10
    let buttonSizeMultiplier: CGFloat = 1.25
    let merchPriceScaleFactor: CGFloat = 0.025
    var imageWidth: CGFloat {
        size.width/2
    }
    var imageHeight: CGFloat {
        size.height/3
    }
}

struct MerchView_Previews: PreviewProvider {
    static var previews: some View {
        MerchView(OTVViewModel())
    }
}
