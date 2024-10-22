//
//  EmptyView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/22/24.
//

import SwiftUI

struct DREmptyView: View {
    
    var image: Image
    
    var title: String
    
    var paddingFromTop: CGFloat = 84
    
    
    var body: some View {
        VStack(spacing: 0) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 394)
            Text(title)
                .setText(alignment: .center,
                         font: .title_bold_18,
                         textColor: .gray300)
            Spacer()
        }
        .background(.white000)
        .padding(.top, paddingFromTop)
    }
}
