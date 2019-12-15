//
//  Model.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import Foundation

struct Response: Codable {
	var commentCount: Int
    var createdAt: String
    var id: Int
    var likeCount: Int
    var postImage: String
    var postMessage: String
    var userFullName: String
	var userImageUrl: String
}
