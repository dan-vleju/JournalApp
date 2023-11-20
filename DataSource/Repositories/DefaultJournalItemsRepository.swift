//
//  DefaultJournalItemsRepository.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation
import Combine

public final class DefaultJournalItemsRepository: JournalItemsRepository {
    
    private let mockedItems = MockedJournalItems.items
    
    public func getAllJournalItems() -> AnyPublisher<[JournalItem], Error> {
        Just(mockedItems)
            .setFailureType(to: Error.self)
            .delay(for: 1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
