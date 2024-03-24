//
//  GridWidget.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct GridWidget: View {
    
    let header: String
    let components: [ComponentProvider]
    
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            WidgetHeaderView(header: header)
            
            LazyVGrid(columns: numberColumns, spacing: 10) {
                ForEach(components, id: \.id) { component in
                    component
                }
            }
        }
    }
}

//#Preview {
//    GridWidget(components: [
//        .exploreTile(data: ExploreTileData(image: "album-poster-1", title: "Pop", subtitle: "Today's chart-toppers and pop sensations")),
//        .exploreTile(data: ExploreTileData(image: "album-poster-2", title: "Pop", subtitle: "Today's chart-toppers and pop sensations"))
//    ])
//}
