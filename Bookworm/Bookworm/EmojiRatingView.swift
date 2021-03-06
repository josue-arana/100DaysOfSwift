//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Josue on 6/8/22.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("âšī¸")
        case 2:
            return Text("đ")
        case 3:
            return Text("đ")
        case 4:
            return Text("đ")
        default:
            return Text("đ¤Š")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 5)
    }
}
