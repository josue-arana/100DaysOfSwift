//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Josue on 4/1/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>( _ file: String ) -> T {
        guard let url = self.url(forResource: file  , withExtension: nil) else {
            fatalError("Failed to loacate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load  \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        //note: when using dates is best practice to be specific about timezone, otherwise it will pick up the current time zone. 
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
