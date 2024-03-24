//
//  HomeView.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: SDUIViewModel = SDUIViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.widgets, id: \.id) { widget in
                        widget
                    }
                }
            }
            .padding()
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
