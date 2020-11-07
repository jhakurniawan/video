//
//  CacheManager.swift
//  video
//
//  Created by rizky on 04/11/20.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setMovieCache (_ url:String, data:Data?){
        
        cache[url] = data
    }
    
    static func getMovieCache (_ url:String) -> Data? {
        
        return cache[url]
    }
}
