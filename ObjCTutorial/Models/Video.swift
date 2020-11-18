//
//  Video.swift
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import Foundation
// MARK: - Video
@objc class Video: NSObject, Codable {
   @objc let id: Int
   @objc let title, videoDescription, iframe: String
    @objc let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case videoDescription = "description"
        case iframe, thumbnail
    }

    @objc class func create(from data: NSData) -> [Video] {
        let decoder = JSONDecoder()
        let item = try! decoder.decode(Videos.self, from: data as Data)
        return item
    }

     required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        videoDescription = try container.decode(String.self, forKey: .videoDescription)
        iframe = try container.decode(String.self, forKey: .iframe)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        super.init()
    }

    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias Videos = [Video]
