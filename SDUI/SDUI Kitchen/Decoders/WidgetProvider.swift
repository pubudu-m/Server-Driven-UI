//
//  WidgetProvider.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

enum WidgetType: String, Decodable {
    case carousel
    case grid
    case list
}

enum WidgetProvider: Identifiable, View {
    case carousel(header: String, components: [ComponentProvider])
    case grid(header: String, components: [ComponentProvider])
    case list(header: String, components: [ComponentProvider])
    
    var id: String { return UUID().uuidString }
    
    @ViewBuilder
    var body: some View {
        switch self {
        case .carousel(let header, let components):
            CarouselWidget(header: header, components: components)
        case .grid(let header, let components):
            GridWidget(header: header, components: components)
        case .list(let header, let components):
            ListWidget(header: header, components: components)
        }
    }
}

struct WidgetContainer: Decodable {
    let widgets: [WidgetProvider]
    
    enum CodingKeys: String, CodingKey {
        case type, header, components
    }
    
    init(from decoder: Decoder) throws {
        var widgetContainer = try decoder.unkeyedContainer()
        var widgetsArray = [WidgetProvider]()
        
        while !widgetContainer.isAtEnd {
            let parsedWidget = try widgetContainer.nestedContainer(keyedBy: CodingKeys.self)
            let type = try parsedWidget.decode(WidgetType.self, forKey: .type)
            let header = try parsedWidget.decode(String.self, forKey: .header)
            let componentsContainer = try parsedWidget.decode(ComponentContainer.self, forKey: .components)
            
            switch type {
            case .carousel:
                let item = WidgetProvider.carousel(header: header, components: componentsContainer.components)
                widgetsArray.append(item)
            case .grid:
                let item = WidgetProvider.grid(header: header, components: componentsContainer.components)
                widgetsArray.append(item)
            case .list:
                let item = WidgetProvider.list(header: header, components: componentsContainer.components)
                widgetsArray.append(item)
            }
        }
        
        self.widgets = widgetsArray
    }
}
