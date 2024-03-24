//
//  SDUIProvider.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import Foundation

struct SDUIProvider: Decodable {
    let title: String
    let widgets: [WidgetProvider]
    
    enum CodingKeys: String, CodingKey {
        case title, widgets
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        let widgetsContainer = try container.decode(WidgetContainer.self, forKey: .widgets)
        self.widgets = widgetsContainer.widgets
    }
}
