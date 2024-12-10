//
//  DateScheduleModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/10/24.
//

import Foundation

struct DateCardModel: Equatable {
    
    let dateID: Int
    
    let title: String
    
    let date: String
    
    let city: String
    
    let tags: [String]
    
    let dDay: Int
    
    init(dateID: Int, title: String, date: String, city: String, tags: [String], dDay: Int) {
        self.dateID = dateID
        self.title = title
        self.date = date
        self.city = city
        self.tags = tags
        self.dDay = dDay
    }
    
    static var emptyModel: DateCardModel {
        return DateCardModel(dateID: 0, title: "", date: "", city: "", tags: [], dDay: 0)
    }
    
    static var dummyData: [DateCardModel] {
        return [
            DateCardModel(
                dateID: 0,
                title: "성수동 당일치기 데이트 가볼까요?",
                date: "2024.12.18",
                city: "건대/성수/왕십리",
                tags: ["PERFORMANCE_MUSIC", "FOOD", "SHOPPING"],
                dDay: 0
            ),
            DateCardModel(
                dateID: 1,
                title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다",
                date: "2024.12.18",
                city: "건대/성수/왕십리",
                tags: ["PERFORMANCE_MUSIC"],
                dDay: 7
            ),
            DateCardModel(
                dateID: 7,
                title: "5년차 장기연애 커플이 보장하는 성수동 당일치기 데이트 코스",
                date: "2024.12.18",
                city: "건대/성수/왕십리",
                tags: ["FOOD", "SHOPPING"],
                dDay: 10
            )
        ]
    }
    
}


struct DateDetailModel: Equatable {
    
    let dateID: Int
    
    let title: String
    
    let startAt: String
    
    let city: String
    
    let tags: [String]
    
    let date: String
    
    let places: [DatePlaceModel]
    
    let dDay: Int
    
    init(dateID: Int, title: String, startAt: String, city: String, tags: [String], date: String, places: [DatePlaceModel], dDay: Int) {
        self.dateID = dateID
        self.title = title
        self.startAt = startAt
        self.city = city
        self.tags = tags
        self.date = date
        self.places = places
        self.dDay = dDay
    }
    
}

struct DatePlaceModel: Equatable {
    
    let name: String
    
    let duration: String
    
    let sequence: Int
    
    init(name: String, duration: String, sequence: Int) {
        self.name = name
        self.duration = duration
        self.sequence = sequence
    }
    
}

struct KakaoPlaceModel {
    
    let name: String?
    
    let duration: Float?
    
    init(name: String?, duration: Float?) {
        self.name = name
        self.duration = duration
    }
    
}
