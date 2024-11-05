//
//  NicknameView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/5/24.
//

import SwiftUI

struct NicknameView: View {
    
    @Binding var nickname: String
    
    @Binding var isValidNicknameCount: Bool
    
    @Binding var isUnusedNickname: Bool
    
    @Binding var initial: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 5) {
                Text(PROFILE.NICKNAME)
                    .font(.suit(.body_bold_15))
                    .foregroundStyle(.black000)
                Text(PROFILE.NICKNAME_CONDITION)
                    .setText(alignment: .leading, font: .body_med_13, textColor: .gray300)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
            
            HStack {
                ZStack {
                    if nickname.isEmpty {
                        Text(PLACEHOLDER.NICKNAME)
                            .setText(font: .body_semi_15, textColor: .gray300, padding: EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .font(.suit(.body_semi_15))
                            .foregroundColor(.gray300) // 원하는 색상으로 지정
                    }
                    TextField("", text: $nickname)
                        .padding(.leading, 16)
                        .onChange(of: nickname) { newValue in
                            initial = true
                            isValidNicknameCount = !(newValue.count < 2 || newValue.count > 5)
                            print("newValue: \(newValue) | count: \(newValue.count)")
                        }
                }
                Button(action: {
                    // TODO: - 서버 통신 결과로 분기처리
                    checkUnusedNickname()
                    print("valid count")
                }) {
                    Text(PROFILE.DOUBLE_CHECK)
                        .font(.suit(.body_med_13))
                        .foregroundStyle(isValidNicknameCount ? .white000 : .gray400)
                }
                .frame(width: 74, height: 30)
                .background(isValidNicknameCount ? .purple600 : .gray200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .disabled(!isValidNicknameCount)
                Spacer(minLength: 16)
            }
            .frame(height: 54)
            .background(.gray100)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 16)
            
            HStack {
                checkNicknameCount()
                Text("\(nickname.count)/5")
                    .setText(alignment: .trailing, font: .cap_reg_11, textColor: .gray300)
            }
            .padding(EdgeInsets(top: 6, leading: 16, bottom: 24, trailing: 16))
        }
    }
    
    @ViewBuilder
    func checkNicknameCount() -> some View {
        if !isValidNicknameCount && initial {
            Text(PROFILE.NICKNAME_COUNT_ERROR)
                .setText(font: .cap_reg_11, textColor: .alertRed)
        }
    }
    
    func checkUnusedNickname() {

    }
}

