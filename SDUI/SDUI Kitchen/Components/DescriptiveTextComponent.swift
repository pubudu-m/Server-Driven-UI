//
//  DescriptiveTextComponent.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct DescriptiveTextData: Decodable {
    let text: String
}

struct DescriptiveTextComponent: View {
    
    let data: DescriptiveTextData
    
    var body: some View {
        Text(data.text)
            .font(.system(size: 14, weight: .regular, design: .default))
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    DescriptiveTextComponent(data: DescriptiveTextData(text: "Explore"))
}
