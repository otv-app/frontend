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
        GeometryReader { geometry in
            ScrollView {
                    VStack {
                        // non-stretch header
//                        ZStack(alignment: .leading) {
//                            self.merchFocusColor
//                            Text("Merch").toMerchLogo(fontScaleFactor: 0.08, size: geometry.size.height, color: Color.white).padding(10)
//                        }
//                        .frame(width: geometry.size.width, height: geometry.size.height / 9)
//                        .padding(.bottom, 50)
                        
                        // stretchy benner
                        GeometryReader { g in
                            ZStack(alignment: .leading) {
                                self.merchFocusColor
                                VStack {
                                    Spacer()
                                    Text("Merch").toMerchLogo(fontScaleFactor: 0.08, size: geometry.size.height, color: Color.white).padding(10)
                                }
                            }
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ?
                                UIScreen.main.bounds.height / self.stretchEffect + g.frame(in: .global).minY :
                                UIScreen.main.bounds.height / self.stretchEffect)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 9)
                        .padding(.bottom, 50)
                        
                        // EVERYTHING ABOVE THIS IS STRETCHY HEADER
                        
    //                        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!+10)
                        
                        // navigation view of merch items
    //                    NavigationView {
    //                        List {
                        VStack {
                                ForEach(self.viewModel.streamers) { streamer in
                                    MerchRowView(streamer: streamer, size: size)
                                }
                        }
    //
    //                        }.navigationBarTitle(Text(""))
    //                            .navigationBarHidden(true)
    //                            .onAppear {
    //                                UITableView.appearance().separatorStyle = .none
    //                        }
    //                    }.navigationViewStyle(StackNavigationViewStyle())
                    }
            }.edgesIgnoringSafeArea(.top)
        }
    }
    
    let merchFocusColor: Color = Color(red: 255/55, green: 113/255, blue: 181/255)
    let stretchEffect: CGFloat = 7
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
            Text(streamer.name).font(.system(size: size.height * merchStreamerNameScaleFactor)).fontWeight(.semibold).padding(.leading, 10)
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
    let merchStreamerNameScaleFactor: CGFloat = 0.045
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
                    .cornerRadius(self.cornerRadius)
                    .scaledToFit()
                    .frame(width: imageWidth, height: imageHeight)
//                    .cornerRadius(self.cornerRadius)
            }.buttonStyle(PlainButtonStyle())
            
            Text("$" + String(self.merch.price)).font(.system(size: size.height * merchPriceScaleFactor))
        }
        .frame(width: size.width/2 * buttonSizeMultiplier, height: size.height/3 * buttonSizeMultiplier)
//        .cornerRadius(self.cornerRadius)
        .shadow(radius: self.shadowRadius)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 30
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
