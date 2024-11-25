//
//  DateTendencyView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/5/24.
//

import SwiftUI

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
    
    @State private var chipData: [TagModel] = TendencyTag.allCases.map { $0.tag }
    
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
