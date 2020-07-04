//
//  MerchView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//
import SwiftUI

//i pass in a viewModel
struct MerchView: View {
    @ObservedObject var viewModel: OTVViewModel
    
    init(_ viewModel: OTVViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    
    var body: some View {
        
        //CHANGES: foreach only takes in an Array<T> where T: Identifiable since u can
        //iterate through identifiables. I pass a Streamer into the MerchRowView instead of
        //StreamerMerch since i moved name to Streamer so i need access to that
        //Wrapped view with a geometryreader so I can pass in a refernce to device size.
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    //CHANGES: put body in helper function so that we don't need to explicitly state reference to
    //self for every variable, apparently swiftui will fix this issue soon but idk
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

struct MerchRowView: View {
    
    //CHANGE: renamed this variable from streamerAndMerch to just streamer of type OTVStreamer instead
    //of StreamerMerch
    var streamer: OTVStreamer
    //CHANGE: added this variable to store size
    var size: CGSize
    
    var body: some View {
        
        //CHANGE: Text() now gets the name from a OTVSTreamer struct not a StreamerMerch
        VStack (alignment: .leading) {
            Text(streamer.name)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(streamer.merch.merches) { item in
                        MerchItemView(merch: item, size: self.size).padding(5)
                    }
                }
                
            }
        }
    }
}

struct MerchItemView: View {
    
    var merch: Merch
    //CHANGE: added this variable to store size
    var size: CGSize
    
    var body: some View {
        VStack {
            Button(action: {
                let url: NSURL = URL(string: self.merch.link)! as NSURL
                
                UIApplication.shared.open(url as URL)
            }) {
                Image(self.merch.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width/2, height: size.height/3)
                    .cornerRadius(self.cornerRadius)
            }.buttonStyle(PlainButtonStyle())
            
            Text("$" + String(self.merch.price))
        }
        .frame(width: size.width/2 * buttonSizeMultiplier, height: size.height/3 * buttonSizeMultiplier)
        .cornerRadius(self.cornerRadius)
        .shadow(radius: self.shadowRadius)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 20
    let shadowRadius: CGFloat = 10
    let buttonSizeMultiplier: CGFloat = 1.25
}


struct MerchView_Previews: PreviewProvider {
    static var previews: some View {
        MerchView(OTVViewModel())
    }
}
