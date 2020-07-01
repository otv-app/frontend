//
//  TwitterView.swift
//  OfflineTV App
//
//  Created by Saahil Kumar on 6/13/20.
//  Copyright © 2020 Saahil Kumar. All rights reserved.
//

import SwiftUI

struct TwitterView: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.top)
            Image("twitter")
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
    }
}
