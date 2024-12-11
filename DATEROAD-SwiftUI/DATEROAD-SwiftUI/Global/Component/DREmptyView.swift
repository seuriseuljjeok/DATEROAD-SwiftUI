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
        VStack(alignment: .center, spacing: 0) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height / 812 * 394)
            Text(title)
                .setText(alignment: .center,
                         font: .title_bold_18,
                         textColor: .gray300,
                         padding: EdgeInsets(top: 0, leading: 84, bottom: 0, trailing: 84),
                         lineLimit: 2)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .background(.white000)
        .padding(.top, paddingFromTop)
    }
}
