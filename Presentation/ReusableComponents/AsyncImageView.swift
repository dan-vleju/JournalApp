//
//  AsyncImageView.swift
//  JournalApp
//
//  Created by Dan Vleju on 19.11.2023.
//

import SwiftUI

struct AsyncImageView: View {
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(.gray)
        }
    }
}
