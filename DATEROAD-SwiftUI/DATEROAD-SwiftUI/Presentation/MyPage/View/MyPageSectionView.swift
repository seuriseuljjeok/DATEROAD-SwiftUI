//
//  MyPageSectionView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct MyPageSectionView: View {
    
    // 부모 뷰 (MyPageView)에서 전달받은 상태 변수
    @Binding var showLogoutAlert: Bool
    
    @Binding var showWithDrawalAlert: Bool
    
    @Binding var isLogout: Bool
    
    let sections = MyPageSection.dataSource
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(sections, id: \.self) { section in
                if section == MyPageSection.myCourse {
                    MyPageSectionItem(
                        title: section.title,
                        showLogoutAlert: $showLogoutAlert,
                        isLogout: $isLogout
                    )
                    .frame(height: 60)
                    .padding(.top, 16)
                    .background(Color.white)
                } else {
                    MyPageSectionItem(
                        title: section.title,
                        showLogoutAlert: $showLogoutAlert,
                        isLogout: $isLogout
                    )
                    .frame(height: 60)
                }
            }
            Spacer()
            Button(action: {
                isLogout = false
                showWithDrawalAlert = true
            }) {
                HStack {
                    Text(MYPAGE.WITHDRAWAL)
                        .setText(
                            alignment: .trailing,
                            font: .body_med_13,
                            textColor: .gray400,
                            padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
                        )
                }
            }
            Spacer()
                .frame(height: 36)
        }
        .background(.white000)
        .padding(.horizontal, 0)
    }
}

struct MyPageSectionItem: View {
    
    var title: String
    
    // 부모 (MyPageSectionView)에서 전달받은 알럿 상태 변수
    @Binding var showLogoutAlert: Bool
    
    @Binding var isLogout: Bool
    
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
        .contentShape(Rectangle())
        .onTapGesture {
            goToNextView(for: title)
        }
        .background (
            NavigationLink(
                destination: nextView,
                isActive: $navigateToNextView,
                label: { EmptyView() }
            )
            .hidden()
        )
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
        .padding(.horizontal, 16)
    }
    
    func goToNextView(for section: String) {
        switch section {
        case MyPageSection.myCourse.title:
            nextView = AnyView(MyRegisteredCourseView().navigationBarBackButtonHidden())
            navigateToNextView = true
        case MyPageSection.pointSystem.title:
            nextView = AnyView(PointSystemView().navigationBarBackButtonHidden())
            navigateToNextView = true
        case MyPageSection.inquiry.title:
            nextView = AnyView(DRWebView(urlString: WEBVIEW.INQUIRY_URL))
            navigateToNextView = true
        case MyPageSection.logout.title:
            isLogout = true
            showLogoutAlert = true
        default:
            print("default")
        }
    }
}
