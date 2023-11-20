//
//  TagView.swift
//  JournalApp
//
//  Created by Dan Vleju on 19.11.2023.
//

import SwiftUI

struct TagView: View {
    
    let tags: [Tag]
    @State private var totalHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                content(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    private func content(in geometry: GeometryProxy) -> some View {
        var bounds = CGSize.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(tags, id: \.self) { tag in
                item(for: tag)
                    .padding(4)
                    .alignmentGuide(.leading) { dimension in
                        if abs(bounds.width - dimension.width) > geometry.size.width {
                            bounds.width = 0
                            bounds.height -= dimension.height
                        }
                        
                        let result = bounds.width
                        
                        if tag == tags.last {
                            bounds.width = 0
                        } else {
                            bounds.width -= dimension.width
                        }
                        
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = bounds.height
                        
                        if tag == tags.last {
                            bounds.height = 0
                        }
                        
                        return result
                    }
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func item(for tag: Tag) -> some View {
        Text("#" + tag)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .frame(height: 24)
            .padding(.horizontal, 8)
            .background{
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(lineWidth: 1)
                    .fill(.secondary)
            }
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            
            return .clear
        }
    }
}

#Preview {
    TagView(tags: MockedJournalItems.items.first!.tags)
}

