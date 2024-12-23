//
//  PointModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/23/24.
//

struct PointInfoModel {

    let nickname: String
    
    let point: Int
    
    init(nickname: String, point: Int) {
        self.nickname = nickname
        self.point = point
    }
    
}

struct PointHistoryModel: Hashable {
    
    let point: Int
    
    let description: String
    
    let createdAt: String
    
    init(point: Int, description: String, createdAt: String) {
        self.point = point
        self.description = description
        self.createdAt = createdAt
    }
    
    static var dummyGainedData: [PointHistoryModel] {
        return [
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 등록하기", createdAt: "2024.06.23"),
        ]
    }
    
    static var dummyUsedData: [PointHistoryModel] {
        return [
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
            PointHistoryModel(point: 50, description: "코스 열람하기", createdAt: "2024.06.23"),
        ]
    }
    
}
