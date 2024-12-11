//
//  ImageWithTitleView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/22/24.
//

import SwiftUI

struct ImageWithTextView: View {
    
    var spacing: CGFloat = 5
    
    var text: String
    
    var textPadding: EdgeInsets = EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 10)
    
    var font: FontName
    
    var textColor: Color = .white000
    
    var image: String = "ic_heart"
    
    var imagePadding: EdgeInsets
    
    var backgroundColor: Color = .purple600
    
    var radius: CGFloat
    
    var viewPadding: EdgeInsets
    
    
    var body: some View {
        HStack(spacing: spacing) {
            Image(image)
                .padding(imagePadding)
            Text(text)
                .font(.suit(font))
                .foregroundStyle(textColor)
                .padding(textPadding)
        }
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
        .padding(viewPadding)
    }
}
