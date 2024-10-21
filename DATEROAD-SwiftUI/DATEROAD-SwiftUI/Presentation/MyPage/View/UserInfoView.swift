//
//  UserInfoView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct UserInfoView: View {
    
    @State private var tagInfoData: MyPageUserInfoModel = MyPageUserInfoModel.emptyModel
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(.emptyProfile)
                    .resizable(resizingMode: .stretch)
                    .clipShape(.circle)
                    .frame(width: 44, height: 44)
                Text(tagInfoData.nickname)
                    .font(.suit(.title_extra_24))
                    .padding(.leading, 16.5)
                Image(.icPencil)
                    .frame(width: 20, height: 20)
                Spacer()
            }
            
            HStack(spacing: 7) {
                ForEach(tagInfoData.tagList, id: \.self) { tagList in
                    if let tagInfo = TendencyTag.getTag(byEnglish: tagList) {
                        TagView(tagInfo: tagInfo)
                    }
                }
                Spacer()
            }
            Spacer().frame(height: 16)
            
            MyPagePointView(nickname: tagInfoData.nickname, point: tagInfoData.point)
        }
    }
}

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

struct MyPagePointView: View {
    
    @State var nickname: String
    
    @State var point: Int
    
    var body: some View {
        VStack(spacing: 11) {
            HStack {
                Text("\(nickname)님의 포인트")
                    .font(.suit(.body_med_13))
                    .foregroundStyle(.gray400)
                    .padding(.leading, 14)
                    .padding(.top, 18)
                Spacer()
            }
            HStack(spacing: 0) {
                Text("\(point) P")
                    .font(.suit(.title_extra_24))
                    .foregroundStyle(.black000)
                Spacer()
                Text(MYPAGE.GO_TO_POINTS_DETAIL)
                    .font(.suit(.body_med_13))
                    .foregroundStyle(.gray400)
                Image(.icRightsmallarrow)
                    .frame(width: 18, height: 18)
            }
            .frame(height: 32)
            .padding(.horizontal, 14)
            .padding(.bottom, 12)
        }
        .background(.white000)
        .clipShape(.rect(cornerRadius: 14))
    }
}
