//
//  ListWidget.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct ListWidget: View {
    
    let header: String
    let components: [ComponentProvider]
    
    var body: some View {
        VStack(spacing: 10) {
            WidgetHeaderView(header: header)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(components, id: \.id) { component in
                    component
                }
            }
        }
    }
}

//#Preview {
//    ListWidget(components: [.titleText(data: TitleText(text: "Explore"))])
//}
