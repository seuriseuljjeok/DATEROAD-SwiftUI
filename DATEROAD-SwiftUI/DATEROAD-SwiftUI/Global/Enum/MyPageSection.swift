//
//  MyPageSection.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import Foundation

enum MyPageSection {
    
    case myCourse
    
    case pointSystem
    
    case inquiry
    
    case logout
    
    var title: String {
        switch self {
        case .myCourse:
            return MYPAGE.MYCOURSE
        case .pointSystem:
            return MYPAGE.POINTSYSTEM
        case .inquiry:
            return MYPAGE.INQUIRY
        case .logout:
            return MYPAGE.LOGOUT
        }
    }
    
    static let dataSource: [MyPageSection] = [
        MyPageSection.myCourse,
        MyPageSection.pointSystem,
        MyPageSection.inquiry,
        MyPageSection.logout
    ]
    
}
