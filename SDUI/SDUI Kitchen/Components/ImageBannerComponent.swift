//
//  ImageBannerComponent.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct ImageBannerData: Decodable {
    let image: String
}

struct ImageBannerComponent: View {
    
    let data: ImageBannerData
    
    var body: some View {
        Image(data.image)
            .resizable()
            .frame(width: 320, height: 120)
            .cornerRadius(20)
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ImageBannerComponent(data: ImageBannerData(image: "event-banner-1"))
}
