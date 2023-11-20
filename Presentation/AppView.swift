//
//  AppView.swift
//  JournalApp
//
//  Created by Dan Vleju on 18.11.2023.
//

import SwiftUI

struct AppView: View {
    private let environment = AppEnvironment.bootstrap()
    
    var body: some View {
        JournalItemsList(viewModel: .init(container: environment.container))
    }
}

#Preview {
    AppView()
}
