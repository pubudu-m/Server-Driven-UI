//
//  Stubber.swift
//  SDUI
//
//  Created by Pubudu Mihiranga on 2024-03-21.
//

import Foundation

enum StubbingError: Error {
    case fileNotFound
    case dataConversionFailure
}

enum Stubber: String {
    case dashboard = "dashboard"
    
    func getMockData() throws -> SDUIProvider {
        guard let file = Bundle.main.url(forResource: self.rawValue, withExtension: "json") else {
            throw StubbingError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: file)
            let decodedData = try JSONDecoder().decode(SDUIProvider.self, from: data)
            return decodedData
        } catch {
            throw StubbingError.dataConversionFailure
        }
    }
}
