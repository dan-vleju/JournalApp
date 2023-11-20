//
//  AppEnvironment.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    
    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let repositories = configuredRepositories()
        let useCases = configuredUseCases(repositories: repositories)
        let diContainer = DIContainer(appState: appState, useCases: useCases)
        
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredRepositories() -> DIContainer.Repositories {
        .init(journalItemsRepository: DefaultJournalItemsRepository())
    }
    
    private static func configuredUseCases(repositories: DIContainer.Repositories) -> DIContainer.UseCases {
        .init(journalItemsUseCase: DefaultJournalItemsUseCase(journalItemsRepository: repositories.journalItemsRepository))
    }
}
