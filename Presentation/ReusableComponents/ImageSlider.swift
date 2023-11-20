//
//  ImageSlider.swift
//  JournalApp
//
//  Created by Dan Vleju on 19.11.2023.
//

import SwiftUI

struct ImageSlider: View {
    let imageURLs: [URL]
    @State var imageURLToDisplay: URL
    @Binding var isDisplayed: Bool
    
    var body: some View {
        ZStack {
            tabView
            closeButton
        }
        .background(Color.gray.ignoresSafeArea())
    }
    
    private var tabView: some View {
        TabView(selection: $imageURLToDisplay) {
            ForEach(imageURLs, id: \.self) { imageURL in
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                } placeholder: {
                    Rectangle().fill(Color.clear)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                Button("Close") {
                    isDisplayed = false
                }
                .padding()
            }
            Spacer()
        }
    }
}
