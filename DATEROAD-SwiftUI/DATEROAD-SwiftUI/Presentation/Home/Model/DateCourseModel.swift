//
//  DateCourseModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/11/24.
//

import Foundation

struct DateCourseModel: Equatable, Hashable {
    
    let courseId: Int
    
    let thumbnail: String
    
    let title: String
    
    let city: String
    
    let like: Int
    
    let cost: Int
    
    let duration: String
    
    init(courseId: Int, thumbnail: String, title: String, city: String, like: Int, cost: Int, duration: String) {
        self.courseId = courseId
        self.thumbnail = thumbnail
        self.title = title
        self.city = city
        self.like = like
        self.cost = cost
        self.duration = duration
    }
    
    static var emptyData: [DateCourseModel] {
        return [DateCourseModel(
            courseId: 0,
            thumbnail: "placeholder",
            title: "성수동 당일치기 데이트 코스",
            city: "건대/성수/왕십리",
            like: 49,
            cost: 100000,
            duration: "10"
        ), DateCourseModel(
            courseId: 1,
            thumbnail: "placeholder",
            title: "5년차 장기연애 커플이 보장하는 성수동 당일치기 데이트 코스",
            city: "건대/성수/왕십리",
            like: 4,
            cost: 27000,
            duration: "10"
        ),DateCourseModel(
            courseId: 2,
            thumbnail: "placeholder",
            title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다",
            city: "강남/서초",
            like: 9,
            cost: 34000,
            duration: "10"
        ),
        DateCourseModel(
            courseId: 3,
            thumbnail: "placeholder",
            title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
            city: "건대/성수/왕십리",
            like: 49,
            cost: 110000,
            duration: "10"
        ),
        DateCourseModel(
            courseId: 4,
            thumbnail: "placeholder",
            title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
            city: "건대/성수/왕십리",
            like: 49,
            cost: 100000,
            duration: "10"
        )]
    }
    
}
