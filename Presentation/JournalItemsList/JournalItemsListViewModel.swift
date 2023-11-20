//
//  JournalItemsListViewModel.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation
import Combine

// MARK: - Routing

extension JournalItemsList {
    struct Routing: Equatable {
        var journalItemId: String?
    }
}

// MARK: - ViewModel

extension JournalItemsList.ViewModel {
    enum State {
        case idle
        case loading
        case content([JournalItem])
        case error(message: String)
    }
}

extension JournalItemsList {
    class ViewModel: ObservableObject {
        
        @Published var routingState: Routing
        @Published var state: State = .idle
        
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()
        
        init(container: DIContainer) {
            self.container = container
            let appState = container.appState
            _routingState = .init(initialValue: appState.value.routing.journalItemsList)
            
            $routingState
                .sink {
                    appState.value.routing.journalItemsList = $0
                }
                .store(in: &cancellables)
            appState.map(\.routing.journalItemsList)
                .removeDuplicates()
                .sink { [weak self] in
                    self?.routingState = $0
                }
                .store(in: &cancellables)
        }
        
        func onAppear() {
            switch state {
            case .idle, .error:
                state = .loading
                loadContent()
            case .loading, .content:
                break
            }
        }
        
        func refreshContent() async {
            DispatchQueue.main.async { [weak self] in
                self?.loadContent()
            }
        }
        
        private func loadContent() {
            container.useCases.journalItemsUseCase.getAllJournalItems()
                .sink { [weak self] in
                    guard case let .failure(error) = $0 else { return }
                    
                    self?.state = .error(message: error.localizedDescription)
                } receiveValue: { [weak self] in
                    self?.state = .content($0.sorted { $0.date > $1.date })
                }
                .store(in: &cancellables)
        }
    }
}
