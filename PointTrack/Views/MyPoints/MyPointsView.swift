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
        Text("Species: \(speciesType)")
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String())
    }
}
