//
//  MyPageView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

struct MyPageView: View {
    
    @State private var showLogoutAlert: Bool = false
    
    @State private var showWithDrawalAlert: Bool = false
    
    @State private var isLogout: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray100)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 16)
                    UserInfoView()
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                        .background(.gray100, ignoresSafeAreaEdges: .all)
                        .clipShape(RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 14))
                        .zIndex(1)
                    MyPageSectionView(showLogoutAlert: $showLogoutAlert,showWithDrawalAlert: $showWithDrawalAlert, isLogout: $isLogout)
                        .zIndex(0)
                        .padding(.top, -16)
                    Spacer()
                }
                .customNavigationBar(hasLeftIcon: false, hasLeftTitle: true, title: NAVBAR.MYPAGE)
                .customAlert(showAlert: isLogout ? $showLogoutAlert : $showWithDrawalAlert,
                             alertType: isLogout ? .DoubleButtonWithSingleTitle : .DoubleButtonWithDoubleTitle,
                             primaryTitle: isLogout ? ALERT.LOGOUT_PRIMARY_TITLE : ALERT.WITHDRAWAL_PRIMARY_TITLE,
                             secondaryTitle: isLogout ? nil : ALERT.WITHDRAWAL_SECONDARY_TITLE,
                             rightButtonTitle: isLogout ? ALERT.LOGOUT : ALERT.CANCEL,
                             leftButtonTitle: isLogout ? ALERT.CANCEL : ALERT.WITHDRAWAL,
                             rightButtonAction: {
                    // TODO: - 추후 서버 통신으로 변경
                    if isLogout {
                        print("로그아웃!")
                    } else {
                        showWithDrawalAlert = false
                    }
                },
                             leftButtonAction: {
                    if isLogout {
                        showLogoutAlert = false
                    } else {
                        print("탈퇴!")
                    }
                })
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
