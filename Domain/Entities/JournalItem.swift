//
//  JournalItem.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import Foundation

public typealias Tag = String

public struct JournalItem: Codable, Hashable, Identifiable {
    public let id: String
    public let date: Date
    public let note: String
    public let mainPhotoURL: URL?
    public let photosURLs: [URL]
    public let tags: [Tag]
}
