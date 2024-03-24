//
//  WidgetHeaderView.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-24.
//

import SwiftUI

struct WidgetHeaderView: View {
    
    let header: String
    
    var body: some View {
        HStack {
            Text(header)
                .font(.system(size: 16, weight: .semibold, design: .default))
            
            Spacer()
        }
    }
}
