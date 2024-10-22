//
//  Text+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/22/24.
//

import SwiftUI

extension Text {
    
    func setText(maxWidth: CGFloat? = .infinity,
                 maxHeight: CGFloat? = nil,
                 alignment: Alignment = .leading,
                 font: FontName,
                 textColor: Color = .black000,
                 padding: EdgeInsets = EdgeInsets(.zero),
                 lineLimit: Int = 1
    ) -> some View {
        self.frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment)
            .lineLimit(lineLimit)
            .font(.suit(font))
            .foregroundStyle(textColor)
            .padding(padding)
    }
    
}
