//
//  JournalItemsUseCase.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation
import Combine

public protocol JournalItemsUseCase {
    func getAllJournalItems() -> AnyPublisher<[JournalItem], Error>
}

public class DefaultJournalItemsUseCase: JournalItemsUseCase {
    
    private let journalItemsRepository: JournalItemsRepository
    
    public init(journalItemsRepository: JournalItemsRepository) {
        self.journalItemsRepository = journalItemsRepository
    }
    
    public func getAllJournalItems() -> AnyPublisher<[JournalItem], Error> {
        journalItemsRepository.getAllJournalItems()
    }
}
