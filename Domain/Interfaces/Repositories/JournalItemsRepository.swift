//
//  JournalItemsRepository.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation
import Combine

public protocol JournalItemsRepository {
    func getAllJournalItems() -> AnyPublisher<[JournalItem], Error>
}
