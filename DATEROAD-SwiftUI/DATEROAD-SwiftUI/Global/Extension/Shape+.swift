//
//  Shape+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, 
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
