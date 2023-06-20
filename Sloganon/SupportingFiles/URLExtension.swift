//
//  URLExtension.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/17/23.
//

import Foundation


extension URL {
    func isReachable(completion: @escaping (Bool) -> ()) {
        var request = URLRequest(url: self)
        request.httpMethod = "HEAD"  

        URLSession.shared.dataTask(with: request) { _, response, _ in
            completion((response as? HTTPURLResponse)?.statusCode == 200)

        }.resume()
        
    }
}
