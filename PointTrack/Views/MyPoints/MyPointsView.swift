//
//  MyPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct MyPointsView: View {
    
    var speciesType: String

    var body: some View {
        VStack {
            Text("Species: \(speciesType)")
        }
        .navigationTitle("\(speciesType) Points")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String())
    }
}
