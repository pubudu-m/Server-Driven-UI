//
//  ComponentProvider.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

enum ComponentType: String, Decodable {
    case imageBanner = "image-banner"
    case descriptiveText = "descriptive-text"
    case exploreTile = "explore-tile"
}

enum ComponentProvider: Identifiable, View {
    case imageBanner(data: ImageBannerData)
    case descriptiveText(data: DescriptiveTextData)
    case exploreTile(data: ExploreTileData)
    
    var id: String { return UUID().uuidString }
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .imageBanner(let data):
            ImageBannerComponent(data: data)
        case .descriptiveText(let data):
            DescriptiveTextComponent(data: data)
        case .exploreTile(let data):
            ExploreTileComponent(data: data)
        }
    }
}

struct ComponentContainer: Decodable {
    var components: [ComponentProvider]
    
    enum CodingKeys: String, CodingKey {
        case type, data
    }
    
    init(from decoder: Decoder) throws {
        var componentsContainer = try decoder.unkeyedContainer()
        var componentsArray = [ComponentProvider]()
        
        while !componentsContainer.isAtEnd {
            let parsedComponent = try componentsContainer.nestedContainer(keyedBy: CodingKeys.self)
            let type = try parsedComponent.decode(ComponentType.self, forKey: .type)
            
            switch type {
            case .imageBanner:
                let data = try parsedComponent.decode(ImageBannerData.self, forKey: .data)
                let item = ComponentProvider.imageBanner(data: data)
                componentsArray.append(item)
            case .descriptiveText:
                let data = try parsedComponent.decode(DescriptiveTextData.self, forKey: .data)
                let item = ComponentProvider.descriptiveText(data: data)
                componentsArray.append(item)
            case .exploreTile:
                let data = try parsedComponent.decode(ExploreTileData.self, forKey: .data)
                let item = ComponentProvider.exploreTile(data: data)
                componentsArray.append(item)
            }
        }
        
        self.components = componentsArray
    }
}
