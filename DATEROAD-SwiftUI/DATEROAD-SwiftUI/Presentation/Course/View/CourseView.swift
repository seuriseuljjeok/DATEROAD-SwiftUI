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
}

struct CourseView_Preview: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
