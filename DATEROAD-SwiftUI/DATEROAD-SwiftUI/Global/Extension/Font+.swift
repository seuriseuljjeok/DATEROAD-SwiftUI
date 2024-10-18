//
//  Font+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/18/24.
//

import SwiftUI

enum FontName {
    case title_extra_24, title_extra_20
    case title_bold_20, title_bold_18, body_bold_17, body_bold_15, body_bold_13, cap_bold_11
    case body_semi_17, body_semi_15, body_semi_13
    case title_med_18, body_med_17, body_med_15, body_med_13, body_med_10
    case cap_reg_11

    var rawValue: String {
        switch self {
        case .title_extra_24, .title_extra_20:
            return "SUIT-ExtraBold"
        case .title_bold_20, .title_bold_18, .body_bold_17, .body_bold_15, .body_bold_13, .cap_bold_11:
            return "SUIT-Bold"
        case .body_semi_17, .body_semi_15, .body_semi_13:
            return "SUIT-SemiBold"
        case .cap_reg_11:
            return "SUIT-Regular"
        case .title_med_18, .body_med_17, .body_med_15, .body_med_13, .body_med_10:
            return "SUIT-Medium"
        }
    }

    var size: CGFloat {
        switch self {
        case .title_extra_24:
            return 24
        case .title_extra_20, .title_bold_20:
            return 20
        case .title_bold_18, .title_med_18:
            return 18
        case .body_bold_17, .body_semi_17, .body_med_17:
            return 17
        case .body_bold_15, .body_semi_15, .body_med_15:
            return 15
        case .body_bold_13, .body_semi_13, .body_med_13:
            return 13
        case .cap_bold_11, .cap_reg_11:
            return 11
        case .body_med_10:
            return 10
        }
    }
}

extension Font {
    static func suit(_ style: FontName) -> Font {
        return Font.custom(style.rawValue, size: style.size)
    }
}
