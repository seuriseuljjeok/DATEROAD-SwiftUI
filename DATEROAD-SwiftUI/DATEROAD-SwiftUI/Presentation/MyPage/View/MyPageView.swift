//
//  MyPageView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

struct MyPageView: View {
    
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray100)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 16)
                    UserInfoView()
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .background(.gray100, ignoresSafeAreaEdges: .all)
                        .clipShape(RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 14))
                        .zIndex(1)
                    MyPageSectionView(showLogoutAlert: $showLogoutAlert)
                        .zIndex(0)
                        .padding(.top, -16)
                    Spacer()
                }
                .customNavigationBar(hasLeftIcon: false, hasLeftTitle: true, title: NAVBAR.MYPAGE)
                .customAlert(showAlert: $showLogoutAlert,
                             alertType: .DoubleButtonWithSingleTitle,
                             primaryTitle: ALERT.LOGOUT_PRIMARY_TITLE,
                             rightButtonTitle: ALERT.LOGOUT,
                             leftButtonTitle: ALERT.CANCEL,
                             rightButtonAction: {
                    // TODO: - 추후 서버 통신으로 변경
                    print("로그아웃!")
                },
                             leftButtonAction: {
                    showLogoutAlert = false
                    //             presentationMode.wrappedValue.dismiss()
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
