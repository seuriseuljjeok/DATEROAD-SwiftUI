//
//  Int+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/11/24.
//

import Foundation

extension Int {
    
    func priceRangeTag() -> String {
        switch self {
        case 0...30000:
            return PRICETAG.UNDER30K
        case 30001...50000:
            return PRICETAG.UNDER50K
        case 50001...100000:
            return PRICETAG.UNDER100K
        default:
            return PRICETAG.OVER100K
        }
    }
    
    func costNum() -> Int {
        switch self {
        case 1:
            return 3
        case 2:
            return 5
        case 3:
            return 10
        case 4:
            return 11
        default:
            return 0
        }
    }
}
