//
//  DIContainer.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import SwiftUI
import Combine

struct DIContainer {
    
    let appState: Store<AppState>
    let useCases: UseCases
    
    init(appState: Store<AppState>, useCases: DIContainer.UseCases) {
        self.appState = appState
        self.useCases = useCases
    }
}

extension DIContainer {
    struct UseCases {
        let journalItemsUseCase: JournalItemsUseCase
    }
    
    struct Repositories {
        let journalItemsRepository: JournalItemsRepository
    }
}
