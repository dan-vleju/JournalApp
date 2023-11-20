//
//  JournalItemsList.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import SwiftUI

struct JournalItemsList: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground
                    .ignoresSafeArea()
                content
                    .onAppear { viewModel.onAppear() }
            }
            .navigationTitle("Daily Gratitude")
        }
    }
    
    @ViewBuilder private var content: some View {
        switch viewModel.state {
        case .content(let journalItems):
            loadedView(journalItems: journalItems)
            
        case .loading:
            ProgressView()
            
        case .error(let message):
            errorView(message: message)
            
        case .idle:
            Text("")
        }
    }
    
    private func loadedView(journalItems: [JournalItem]) -> some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(journalItems, id: \.self) { journalItem in
                    NavigationLink(
                        destination: self.detailsView(journalItem: journalItem),
                        tag: journalItem.id,
                        selection: self.$viewModel.routingState.journalItemId) {
                            JournalItemCell(journalItem: journalItem)
                        }
                        .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 16)
        }
        .padding(.top, 8)
        .refreshable {
            await viewModel.refreshContent()
        }
    }
    
    private func detailsView(journalItem: JournalItem) -> some View {
        JournalItemDetails(viewModel: .init(journalItem: journalItem, container: viewModel.container))
    }
    
    private func errorView(message: String) -> some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.red)
                .font(.system(size: 40))
            Text(message)
                .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    JournalItemsList(viewModel: .init(container: AppEnvironment.bootstrap().container))
}
