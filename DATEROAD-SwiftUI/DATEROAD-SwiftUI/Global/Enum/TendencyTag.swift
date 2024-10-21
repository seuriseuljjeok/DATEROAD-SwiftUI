//
//  TendencyTag.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

enum TendencyTag: Int, CaseIterable {
    
    case drive
    
    case shopping
    
    case inside
    
    case healing
    
    case alcohol
    
    case epicurism
    
    case atelier
    
    case nature
    
    case activity
    
    case show
    
    case popUp
    
    var tag: TagModel {
        switch self {
        case .drive:
            return TagModel(tagIcon: Image(.icCar), tagTitle: "드라이브", english: "DRIVE")
        case .shopping:
            return TagModel(tagIcon: Image(.icShopping), tagTitle: "쇼핑", english: "SHOPPING")
        case .inside:
            return TagModel(tagIcon: Image(.icDoor), tagTitle: "실내", english: "INDOORS")
        case .healing:
            return TagModel(tagIcon: Image(.icTea), tagTitle: "힐링", english: "HEALING")
        case .alcohol:
            return TagModel(tagIcon: Image(.icChampagne), tagTitle: "알콜", english: "ALCOHOL")
        case .epicurism:
            return TagModel(tagIcon: Image(.icRamen), tagTitle: "식도락", english: "FOOD")
        case .atelier:
            return TagModel(tagIcon: Image(.icRing), tagTitle: "공방", english: "WORKSHOP")
        case .nature:
            return TagModel(tagIcon: Image(.icMountains), tagTitle: "자연", english: "NATURE")
        case .activity:
            return TagModel(tagIcon: Image(.icRoller), tagTitle: "액티비티", english: "ACTIVITY")
        case .show:
            return TagModel(tagIcon: Image(.icMask), tagTitle: "공연·음악", english: "PERFORMANCE_MUSIC")
        case .popUp:
            return TagModel(tagIcon: Image(.icPaint), tagTitle: "전시·팝업", english: "EXHIBITION_POPUP")
        }
    }
    
    static func getTag(byEnglish english: String) -> TendencyTag? {
        return TendencyTag.allCases.first { $0.tag.english == english }
    }
    
}
