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
        NavigationView {
            List {
                
                ForEach(viewModel.streamers) { streamer in
                    MerchRowView(streamer: streamer)
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
    
    var body: some View {
        
        //CHANGE: Text() now gets the name from a OTVSTreamer struct not a StreamerMerch
        VStack (alignment: .leading) {
            Text(streamer.name)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(streamer.merch.merches) { item in
                        MerchItemView(merch: item).padding(5)
                    }
                }
                
            }
        }
    }
}

struct MerchItemView: View {
    
    var merch: Merch
    
    var body: some View {
        VStack {
            Button(action: {
                let url: NSURL = URL(string: self.merch.link)! as NSURL

                UIApplication.shared.open(url as URL)
            }) {
                Image(merch.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(cornerRadius)
            }.buttonStyle(PlainButtonStyle())

            Text("$" + String(merch.price))
        }
        .frame(width: 250, height: 250)
        .cornerRadius(cornerRadius)
        .shadow(radius: shadowRadius)
    }
    
    let cornerRadius: CGFloat = 20
    let shadowRadius: CGFloat = 10
}
