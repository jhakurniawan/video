//
//  Model.swift
//  video
//
//  Created by rizky on 02/11/20.
//

import Foundation

class Model {
    func getMovie () {
        let url = URL(string: Constant.API_URL)
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil{
                return
            }
            
            do {
               
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch{
                
            }
        }
        
        datatask.resume()
    }
}
