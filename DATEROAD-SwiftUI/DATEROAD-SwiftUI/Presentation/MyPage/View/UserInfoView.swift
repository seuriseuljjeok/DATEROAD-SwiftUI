//
//  UserInfoView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import Foundation
struct TagView: View {
    
    @State var tagInfo: TendencyTag
        
    var body: some View {
        HStack {
            tagInfo.tag.tagIcon
                .frame(width: 18, height: 18)
            Text(tagInfo.tag.tagTitle)
                .font(.suit(.body_med_13))
                .foregroundStyle(.black000)
        }
        .padding(EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14))
        .background(.white000)
        .clipShape(.rect(cornerRadius: 20))
    }
}
