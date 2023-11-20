//
//  JournalItemCell.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import SwiftUI

struct JournalItemCell: View {
    
    let journalItem: JournalItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(journalItem.date, style: .date)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(journalItem.note)
                .lineLimit(3)
                .font(.headline)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let imageURL = journalItem.mainPhotoURL {
                AsyncImageView(imageURL: imageURL)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            
            if !journalItem.tags.isEmpty {
                TagView(tags: journalItem.tags)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 4)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    JournalItemCell(journalItem: MockedJournalItems.items.first!)
}
