//
//  CourseView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/19/24.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(.white000)
                    CourseFilteringView
            }
            .customNavigationBar(
                hasRightIcon: true,
                hasLeftTitle: true,
                title: COURSE.LOOK_AROUND_COURSE,
                rightIconAction:  {
                    // TODO: - 코스 등록하기 이동
                })
        }
    }
    
    private var CourseFilteringView: some View {
        VStack(alignment: .center, spacing: 3) {
                HStack {
                    Group {
                        HStack {
                            Text(COURSE.LOCATION)
                                .setText(
                                    font: .body_med_13,
                                    textColor: .gray400,
                                    padding: EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 0)
                                )
                            Spacer()
                            Image(.icDropdown)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                                .onTapGesture {
                                    // TODO: - 필터링 초기화
                                }
                        }
                    }
                    .frame(width: 150, height: 30)
                    .background(.gray100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    Image(.btnResetIos)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
                .onTapGesture {
                    // TODO: - 지역 필터 바텀시트 띄우기
                }
                .frame(height: 44)
                HStack(spacing: 8) {
                    ForEach(priceFilter.indices, id: \.self) { index in
                        Text(priceFilter[index])
                            .setText(
                                alignment: .center,
                                font: .body_med_13,
                                textColor: .gray400,
                                padding: EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0)
                            )
                            .frame(height: 30)
                            .background(.gray100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .onTapGesture {
                                // TODO: - 필터링된 가격에 따라 서버 통신
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        .padding(EdgeInsets(top: 9, leading: 0, bottom: 20, trailing: 0))
    }
}

struct CourseView_Preview: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
