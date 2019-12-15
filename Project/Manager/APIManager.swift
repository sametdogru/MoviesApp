//
//  APIManager.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//


import Foundation
import Alamofire

class APIManager: NSObject {
    
    static let shared = APIManager()
    
	typealias CompletionHandler = (_ success: Bool, _ response: AFDataResponse<Any>) -> Void
    
    func fetchData(_ url: String, compBlock: @escaping CompletionHandler) {

        AF.request(url).responseJSON { result in
            if result.response?.statusCode != 200 {
                compBlock(false, result)
            } else {
                compBlock(true, result)
            }
        }
    }
}
