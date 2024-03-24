//
//  SDUIViewModel.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import Foundation

@MainActor
class SDUIViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var widgets: [WidgetProvider] = []
    
    init() {
        fetchUI()
    }
    
    func fetchUI() {
        Task {
            do {
                let data = try Stubber.dashboard.getMockData()
                title = data.title
                widgets = data.widgets
            } catch {
                print(error)
            }
        }
    }
}
