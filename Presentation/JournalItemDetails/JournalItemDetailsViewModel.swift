//
//  JournalItemDetailsViewModel.swift
//  JournalApp
//
//  Created by Dan Vleju on 19.11.2023.
//

import Combine
import Foundation

// MARK: - Routing

extension JournalItemDetails {
    struct Routing: Equatable {
        var imageSliderSheet: Bool = false
    }
}

// MARK: - ViewModel

extension JournalItemDetails {
    class ViewModel: ObservableObject {
        
        @Published var routingState: Routing
        @Published var journalItem: JournalItem
        
        var selectedPhotoURL: URL?
        var allPhotosURLs: [URL] {
            [journalItem.mainPhotoURL].compactMap { $0 } + journalItem.photosURLs
        }
        
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()
        
        init(journalItem: JournalItem, container: DIContainer) {
            self.journalItem = journalItem
            self.container = container
            let appState = container.appState
            _routingState = .init(initialValue: appState.value.routing.journalItemDetails)
            
            $routingState
                .sink {
                    appState.value.routing.journalItemDetails = $0
                }
                .store(in: &cancellables)
            appState.map(\.routing.journalItemDetails)
                .removeDuplicates()
                .sink { [weak self] in
                    self?.routingState = $0
                }
                .store(in: &cancellables)
        }
        
        func showImageSliderView(selectedPhotoURL: URL) {
            self.selectedPhotoURL = selectedPhotoURL
            routingState.imageSliderSheet = true
        }
    }
}
