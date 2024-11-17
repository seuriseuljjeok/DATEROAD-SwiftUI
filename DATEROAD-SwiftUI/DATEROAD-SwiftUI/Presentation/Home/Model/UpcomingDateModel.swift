//
//  UpcomingDateModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/9/24.
//

import Foundation

struct UpcomingDateModel: Equatable {
    
    let dateId : Int
    
    let dDay : Int
    
    let dateName : String
    
    let month : Int
    
    let day : Int
    
    let startAt : String
    
    static var emptyData: UpcomingDateModel {
        return UpcomingDateModel(dateId: 0, dDay: 0, dateName: "성수 데이트 성수 데이트 성수 데이트 성수 데이트 성수 데이트 성수 데이트", month: 12, day: 25, startAt: "12:00 PM")
    }
    
}
