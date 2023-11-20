//
//  JournalItemDetails.swift
//  JournalApp
//
//  Created by Dan Vleju on 19.11.2023.
//

import SwiftUI

struct JournalItemDetails: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 8) {
                        Button {
                            // TODO: handle edit action
                        } label: {
                            Image(systemName: "pencil")
                        }
                        
                        Button {
                            // TODO: handle delete action
                        } label: {
                            Image(systemName: "xmark.bin")
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.routingState.imageSliderSheet) {
                if let selectedPhotoURL = viewModel.selectedPhotoURL {
                    ImageSlider(imageURLs: viewModel.allPhotosURLs,
                                imageURLToDisplay: selectedPhotoURL,
                                isDisplayed: $viewModel.routingState.imageSliderSheet)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder private var content: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                Text(viewModel.journalItem.date, style: .date)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(viewModel.journalItem.note)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 8) {
                    if let imageURL = viewModel.journalItem.mainPhotoURL {
                        AsyncImageView(imageURL: imageURL)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 230)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .onTapGesture {
                                viewModel.showImageSliderView(selectedPhotoURL: imageURL)
                            }
                    }
                    
                    photosGrid
                }
                
                TagView(tags: viewModel.journalItem.tags)
            }
            .padding()
        }
    }
    
    @ViewBuilder private var photosGrid: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 62))], spacing: 8) {
            ForEach(viewModel.journalItem.photosURLs, id: \.self) { imageURL in
                AsyncImageView(imageURL: imageURL)
                    .frame(width: 62, height: 62)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .onTapGesture {
                        viewModel.showImageSliderView(selectedPhotoURL: imageURL)
                    }
            }
        }
    }
}

#Preview {
    JournalItemDetails(
        viewModel: .init(
            journalItem: MockedJournalItems.items.first!,
            container: AppEnvironment.bootstrap().container
        )
    )
}
