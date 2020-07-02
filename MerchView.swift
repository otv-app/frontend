//
//  MerchView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//
import SwiftUI

struct MerchView: View {
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    let streamerMerchInfo: [StreamerMerch] = [
        .init(id: 0, streamer: "OfflineTV", merches: [.init(id: 0, price: 44.99, image: "offlinetv1", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-hoodie-black-white-limited-edition"), .init(id: 1, price: 49.99, image: "offlinetv2", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-slant-hoodie-black-yellow-limited-edition"), .init(id: 2, price: 79.99, image: "offlinetv3", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-split-windbreaker-black-white-limited-edition"), .init(id: 3, price: 19.99, image: "offlinetv4", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-stacked-tee-black"), .init(id: 4, price: 24.99, image: "offlinetv5", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-white"), .init(id: 5, price: 24.99, image: "offlinetv6", link: "https://offlinetv.3blackdot.com/collections/frontpage/products/offlinetv%C2%AE-embroidered-logo-tee-black")]),
        .init(id: 1, streamer: "LilyPichu", merches: [.init(id: 0, price: 25.55, image: "lilyShirt", link: "https://lilypichustore.com/products/temmies-short-sleeve-t-shirt"), .init(id: 1, price: 15.00, image: "lilySticker1", link: "https://lilypichustore.com/products/lily-sticker-set-pack-of-3"), .init(id: 2, price: 15.00, image: "lilySticker2", link: "https://lilypichustore.com/products/temmie-sticker-set-pack-of-3")]),
        .init(id: 2, streamer: "Fedmyster", merches: [.init(id: 0, price: 24.99, image: "fedHat", link: "https://metathreads.com/collections/fedmyster/products/fedmyster-black-snapback")]),
        .init(id: 3, streamer: "Pokimane", merches: [.init(id: 0, price: 0.99, image: "gasPoki", link: "https://www.google.com/"), .init(id: 1, price: 2.99, image: "uwuPoki", link: "https://www.google.com/")]),
        .init(id: 4, streamer: "DisguisedToast", merches: [.init(id: 0, price: 10.99, image: "toast", link: "https://disguisedtoast.com/")])
    ]
    
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(streamerMerchInfo, id: \.id) { info in
                    MerchRowView(streamerAndMerch: info)
                }
                
            }.navigationBarTitle(Text("Merch"))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct MerchRowView: View {
    
    var streamerAndMerch: StreamerMerch
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text(streamerAndMerch.streamer)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(streamerAndMerch.merches, id: \.id) { item in
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

struct Merch: Identifiable {
    let id: Int
    let price: Double
    let image: String
    let link: String
}

struct StreamerMerch: Identifiable {
    let id: Int
    let streamer: String
    let merches: [Merch]
}

struct MerchView_Previews: PreviewProvider {
    static var previews: some View {
        MerchView()
    }
}
