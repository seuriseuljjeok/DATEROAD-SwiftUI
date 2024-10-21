//
//  MyPageView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

struct MyPageView: View {
    
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
                    MyPageSectionView()
                        .zIndex(0)
                        .padding(.top, -16)
                    Spacer()
                }
                .customNavigationBar(hasLeftIcon: false, hasLeftTitle: true, title: NAVBAR.MYPAGE)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
