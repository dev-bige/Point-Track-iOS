//
//  ButtonView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .foregroundColor(Color.white)
            .bold()
            .background(Color("MainColor"))
            .frame(width: 275.0, height: 5.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: String())
    }
}
