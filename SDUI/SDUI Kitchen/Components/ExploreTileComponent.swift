//
//  ExploreComponent.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct ExploreTileData: Decodable {
    let image: String
    let title: String
    let subtitle: String
}

struct ExploreTileComponent: View {
    
    let data: ExploreTileData
    
    var body: some View {
        HStack {
            Image(data.image)
                .resizable()
                .frame(width: 60)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(data.title)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                
                Text(data.subtitle)
                    .font(.system(size: 12, weight: .regular, design: .default))
                
                Spacer(minLength: 0)
            }
            .multilineTextAlignment(.leading)
            .padding([.top, .bottom, .trailing], 5)
        }
        .frame(height: 80)
        .background(Color(red: 247/256, green: 249/256, blue: 249/256))
        .cornerRadius(10)
    }
}

#Preview {
    ExploreTileComponent(data: ExploreTileData(image: "album-poster-1", 
                                               title: "Billing",
                                               subtitle: "View upcoming, past bills and get usage log"))
}
