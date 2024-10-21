//
//  MyPageSectionView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct MyPageSectionView: View {
    
    let sections = MyPageSection.dataSource

    var body: some View {
        VStack(spacing: 0) {
            ForEach(sections, id: \.self) { section in
                if section == MyPageSection.myCourse {
                    MyPageSectionItem(title: section.title)
                        .frame(height: 60)
                        .padding(.top, 16)
                        .background(Color.white)
                } else {
                    MyPageSectionItem(title: section.title)
                        .frame(height: 60)
                }
            }
            Spacer()
            Button(action: {
                
            }) {
                HStack {
                    Spacer()
                    Text(MYPAGE.WITHDRAWAL)
                        .font(.suit(.body_med_13))
                        .foregroundStyle(.gray400)
                        .padding(.trailing, 20)
                }
            }
            Spacer().frame(height: 36)
        }
        .background(.white000)
        .padding(.horizontal, 0)
    }
}

struct MyPageSectionItem: View {
    
    var title: String
    
    @State private var navigateToNextView: Bool = false
    
    @State private var nextView: AnyView?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.suit(.body_semi_15))
                .foregroundStyle(.black000)
            Spacer()
            Image(.icRightarrow)
        }
        .onTapGesture {
            goToNextView(for: title)
        }
        .background (
            NavigationLink(
                destination: nextView,
                isActive: $navigateToNextView,
                label: { EmptyView() }
            )
        )
        .padding(.horizontal, 16)
    }
    
    func goToNextView(for section: String) {
        switch section {
        case MyPageSection.myCourse.title:
            print("go to mycourse")
        case MyPageSection.pointSystem.title:
            print("go to pointSystem")
        case MyPageSection.inquiry.title:
            print("go to inquiry")
        case MyPageSection.logout.title:
            print("go to logout")
        default:
            print("default")
        }
    }
}
