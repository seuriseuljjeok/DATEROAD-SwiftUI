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
        return MyPageUserInfoModel(
            nickname: "스리",
            tagList: ["DRIVE", "SHOPPING", "WORKSHOP"],
            point: 0,
            imageURL: nil
        )
    }
    
}

public protocol Chipable: Identifiable {
    
    var id: UUID { get }
    
    var tagIcon: String { get }
    
    var tagTitle: String { get }
    
    var english: String { get }
    
}

struct TagModel: Chipable {
    
    let id: UUID
    
    let tagIcon: String
    
    let tagTitle: String
    
    let english: String
    
    // 기본값으로 id를 자동 생성하도록 초기화
    init(id: UUID = UUID(), tagIcon: String, tagTitle: String, english: String) {
        self.id = id
        self.tagIcon = tagIcon
        self.tagTitle = tagTitle
        self.english = english
    }
    
}

extension TagModel {
    
    static var emptyTagModel: TagModel {
        return TagModel(tagIcon: "ic_car", tagTitle: "드라이브", english: "DRIVE")
    }
    
}
