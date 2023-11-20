//
//  AppState.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Combine

typealias Store<State> = CurrentValueSubject<State, Never>

struct AppState: Equatable {
    var routing = ViewRouting()
}

extension AppState {
    struct ViewRouting: Equatable {
        var journalItemsList = JournalItemsList.Routing()
        var journalItemDetails = JournalItemDetails.Routing()
    }
}
