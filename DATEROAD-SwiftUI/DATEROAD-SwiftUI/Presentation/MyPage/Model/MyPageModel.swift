//
//  TagModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct MyPageUserInfoModel {
    
    let nickname: String
    
    let tagList: [String]
    
    let point: Int
    
    let imageURL: String?
    
    init(nickname: String, tagList: [String], point: Int, imageURL: String?) {
        self.nickname = nickname
        self.tagList = tagList
        self.point = point
        self.imageURL = imageURL
    }
    
    static var emptyModel: MyPageUserInfoModel {
        return MyPageUserInfoModel(nickname: "스리",
                                   tagList: ["DRIVE", "SHOPPING", "WORKSHOP"],
                                   point: 0,
                                   imageURL: nil)
    }
    
}

struct TagModel {
    
    let tagIcon: Image
    
    let tagTitle: String
    
    let english: String
    
}

extension TagModel {
    
    static var emptyTagModel: TagModel {
        return TagModel(tagIcon: Image(.icCar), tagTitle: "드라이브", english: "DRIVE")
    }
    
}
