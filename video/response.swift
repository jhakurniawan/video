//
//  response.swift
//  video
//
//  Created by rizky on 02/11/20.
//

import Foundation

struct Response: Decodable {
    
    var items:[Movie]?
    
    enum CodingKeys: String, CodingKey{
        case items
    }
    init (from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Movie].self, forKey: .items)
    }
}
