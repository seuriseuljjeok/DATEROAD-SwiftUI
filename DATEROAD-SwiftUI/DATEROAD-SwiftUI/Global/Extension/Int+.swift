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
    
}
