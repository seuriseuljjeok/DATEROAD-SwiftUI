//
//  CourseModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/22/24.
//

import Foundation

struct CourseModel: Hashable {
    
    let courseId: Int
    
    let thumbnail: String
    
    let title: String
    
    let city: String
    
    let cost: String
    
    let duration: String
    
    let like: Int
    
    init(courseId: Int, thumbnail: String, title: String, city: String, cost: String, duration: String, like: Int) {
        self.courseId = courseId
        self.thumbnail = thumbnail
        self.title = title
        self.city = city
        self.cost = cost
        self.duration = duration
        self.like = like
    }
    
    static var dummyData: [CourseModel] {
        return [CourseModel(courseId: 1, thumbnail: "empty_course", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "10시간", like: 5),
                CourseModel(courseId: 1, thumbnail: "img_point2", title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "9시간", like: 7),
                CourseModel(courseId: 1, thumbnail: "img_point3", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "1시간", like: 11),
                CourseModel(courseId: 1, thumbnail: "empty_course", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "2시간", like: 3),
                CourseModel(courseId: 1, thumbnail: "img_point3", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "5시간", like: 4),
                CourseModel(courseId: 1, thumbnail: "img_point2", title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "4시간", like: 15),
                CourseModel(courseId: 1, thumbnail: "empty_course", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "7시간", like: 12),
                CourseModel(courseId: 1, thumbnail: "img_point2", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "13시간", like: 45),
                CourseModel(courseId: 1, thumbnail: "empty_course", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "12시간", like: 3),
                CourseModel(courseId: 1, thumbnail: "img_point4", title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "1시간", like: 57),
                CourseModel(courseId: 1, thumbnail: "img_point3", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "4시간", like: 50),
                CourseModel(courseId: 1, thumbnail: "img_point2", title: "여기 야키니쿠 꼭 먹으러 가세요 하지만 일본에 있습니다", city: "건대/성수/왕십리", cost: "10만원 초과", duration: "6시간", like: 5)
        ]
    }
    
}
