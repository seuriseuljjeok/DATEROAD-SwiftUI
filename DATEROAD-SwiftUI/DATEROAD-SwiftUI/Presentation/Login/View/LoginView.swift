//
//  ContentView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/18/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Color(.purple600).ignoresSafeArea()
            VStack {
                Spacer().frame(height: 210)
                Image(.icSplashlogo)
                Spacer()
                Button(action: {
                    
                }) {
                    HStack {
                        Image(.kakaoLogo)
                            .padding(.leading, 14)
                        Text(LOGIN.KAKAO_LOGIN)
                            .font(.system(size: 15, weight: .semibold))
                            .padding(.leading, 75)
                            .foregroundStyle(.black000.opacity(0.85))
                        Spacer()
                    }
                    .frame(height: 45) // 버튼 자체의 높이 설정
                    .background(.kakaoYellow)
                    .cornerRadius(6)
                    .padding(.horizontal, 37) // 버튼의 좌우 여백 설정
                }
                Spacer().frame(height: 16)
                Button(action: {
                    
                }) {
                    Text(LOGIN.APPLE_LOGIN)
                        .setText(maxHeight: 45,
                                 alignment: .center,
                                 font: .body_bold_15,
                                 textColor: .white000)
                        .background(.black000)
                        .cornerRadius(6)
                        .padding(.horizontal, 37) // 버튼의 좌우 여백 설정
                }
                Spacer().frame(height: 30)
                Button(action: {
                    
                }) {
                    Text(LOGIN.PRIVACY_POLICY)
                        .font(.suit(.body_med_15))
                        .underline()
                        .foregroundStyle(.gray200)
                }
                .padding(.bottom, 25)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
