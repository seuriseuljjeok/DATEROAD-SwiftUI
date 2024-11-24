//
//  CourseModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/24/24.
//

import Foundation

struct CourseListModel {
    
    let courseId: Int
    
    let thumbnail: String
    
    let location: String
    
    let title: String
    
    let cost: Int
    
    let time: Float
    
    let like: Int
    
    init(courseId: Int, thumbnail: String, location: String, title: String, cost: Int, time: Float, like: Int) {
        self.courseId = courseId
        self.thumbnail = thumbnail
        self.location = location
        self.title = title
        self.cost = cost
        self.time = time
        self.like = like
    }
    
    static var dummy: [CourseListModel] {
        return [
            CourseListModel(
                courseId: 0,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기",
                cost: 40000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 1,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 3.5,
                like: 10
            ),
            CourseListModel(
                courseId: 2,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 160000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 3,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스",
                cost: 50000,
                time: 2.5,
                like: 10
            ),
            CourseListModel(
                courseId: 4,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 0.5,
                like: 10
            ),
            CourseListModel(
                courseId: 5,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 10000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 6,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 70000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 7,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 4.5,
                like: 10
            ),
            CourseListModel(
                courseId: 8,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 9,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 10,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 11,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 12,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 13,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 14,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 15,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 16,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 17,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 18,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기 데이트 코스 둘러 보러 가실까요?",
                cost: 110000,
                time: 1.5,
                like: 10
            ),
            CourseListModel(
                courseId: 19,
                thumbnail: "empty_course",
                location: "건대/상수/왕십리",
                title: "성수동 당일치기",
                cost: 110000,
                time: 1.5,
                like: 10
            )
        ]
    }
}
