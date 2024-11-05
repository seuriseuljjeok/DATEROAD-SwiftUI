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

struct DateTendencyView: View {
    
    @Binding var tagCount: Int
    
    @Binding var isValidTagCount: Bool
    
    @State private var selectedTags: [Bool] = Array(repeating: false, count: TendencyTag.allCases.count)
    
    private let tagData: [TagModel] = TendencyTag.allCases.map { $0.tag }
    
    private let columns = [GridItem(.adaptive(minimum: 67, maximum: 100), spacing: 7)]
    
    var body: some View {
        VStack(spacing: 0) {
            Text(PROFILE.MY_TENDENCY + " (\(tagCount)/3)")
                .setText(font: .body_bold_15, textColor: .black000)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
            ChipView(tagCount: $tagCount, isValidTagCount: $isValidTagCount)
                .padding(.horizontal, 16)
            if !isValidTagCount {
                Text(PROFILE.TAG_COUNT_ERROR)
                    .setText(font: .cap_reg_11, textColor: .alertRed)
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 0, trailing: 16))
            }
            Spacer()
        }
    }
}

struct ChipView: View {
    
    @Binding var tagCount: Int
    
    @Binding var isValidTagCount: Bool
    
    @State private var selectedTags: [Bool] = Array(repeating: false, count: TendencyTag.allCases.count)
    
    @State private var chipData: [any Chipable] = TendencyTag.allCases.map { $0.tag }
    
    @State private var height: CGFloat = 106 // ChipView의 높이를 저장하기 위한 상태 변수

    
    var body: some View {
        GeometryReader { geometry in
            ChipLayoutView(
                tagData: $chipData,
                verticalSpacing: 8,
                horizontalSpacing: 7
            ) { index in
                let data = chipData[index]
                Button(action: {
                    withTransaction(Transaction(animation: nil)) {
                        if selectedTags[index] {
                            selectedTags[index] = false
                            tagCount -= 1
                        } else {
                            if tagCount < 3 {
                                selectedTags[index] = true
                                tagCount += 1
                            }
                        }
                    }
                    checkTagCount()
                }) {
                    HStack(spacing: 2) {
                        Image(data.tagIcon)
                            .padding(.leading, 16)
                        Text(data.tagTitle)
                            .font(.suit(.body_med_13))
                            .padding(.trailing, 12)
                            .foregroundColor(selectedTags[index] ? .white000 : .black000)
                    }
                }
                .frame(height: 30)
                .background(selectedTags[index] ? .purple600 : .gray100) // 선택된 상태에 따라 배경색 변경
                .cornerRadius(15)
            }
            .onAppear {
                // ChipLayoutView의 높이를 ChipView의 높이로 설정
                let totalHeight = geometry.size.height
                print("Total Height: \(totalHeight)")
                DispatchQueue.main.async {
                    // ChipView의 높이를 ChipLayoutView의 총 높이에 맞게 설정
                    self.height = totalHeight
                }
            }
        }
        .frame(height: height)
    }
    
    func checkTagCount() {
        isValidTagCount = tagCount > 0 && tagCount < 4
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
