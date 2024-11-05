//
//  ProfileView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/30/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var nickname: String = ""
    
    @State private var isValidNicknameCount: Bool = false
    
    @State private var isUnusedNickname: Bool = false
    
    @State private var tagCount: Int = 0
    
    @State private var isValidTagCount: Bool = true
    
    @State private var initial: Bool = false
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(.emptyLargeProfile)
                    .frame(width: 121, height: 121)
                    .clipShape(Circle())
                Image(.icProfileplus)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            .padding(.vertical, 43)
            
            NicknameView(
                nickname: $nickname,
                isValidNicknameCount: $isValidNicknameCount,
                isUnusedNickname: $isUnusedNickname,
                initial: $initial
            )
            DateTendencyView(tagCount: $tagCount, isValidTagCount: $isValidTagCount)
        }
        .customNavigationBar(hasCenterTitle: true, title: PROFILE.MY_PROFILE)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
