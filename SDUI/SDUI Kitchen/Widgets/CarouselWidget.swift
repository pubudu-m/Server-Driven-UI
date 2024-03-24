//
//  CarouselWidget.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct CarouselWidget: View {
    
    let header: String
    let components: [ComponentProvider]
    
    var body: some View {
        VStack(spacing: 10) {
            WidgetHeaderView(header: header)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(components, id: \.id) { component in
                        component
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

//#Preview {
//    CarouselWidget(components: [
//        .imageBanner(data: ImageBannerData(image: "event-banner-1")),
//        .imageBanner(data: ImageBannerData(image: "event-banner-2"))
//    ])
//}

