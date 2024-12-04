//
//  NewDateCourseView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/13/24.
//

import SwiftUI

struct NewDateCourseView: View {
    var body: some View {
        VStack(spacing: 0) {
            NewDateCourseTitleView()
            NewDateCourseListView()
        }
        .frame(maxWidth: .infinity, maxHeight: 495)
        .padding(.top, 31)
        .background(.white000)
    }
}

struct NewDateCourseTitleView: View {
    var body: some View {
        VStack(spacing: 3) {
            Text(HOME.NEW_DATE_TITLE)
                .setText(font: .title_extra_20)
            HStack {
                Text(HOME.NEW_DATE_SUB_TITLE)
                    .setText(font: .body_med_13, textColor: .gray400)
                Spacer()
                Text(HOME.GO_TO_DATE)
                    .setText(
                        maxWidth: 35,
                        font: .body_bold_13,
                        textColor: .purple500
                    )
                    .onTapGesture {
                        // TODO: - 코스 둘러보기 이동
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 20))
    }
}

struct NewDateCourseListView: View {
    
    @State var newDateCourseData: [MyCourseModel] = MyCourseModel.newDateCourseDummyData
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach($newDateCourseData, id: \.courseId) { data in
                HorizontalCourseItem(course: data)
                    .padding(.horizontal, 16)
                    .onTapGesture {
                        // TODO: - 코스 상세 이동
                    }
            }
        }
    }
}


struct NewDateCourseView_Previews: PreviewProvider {
    static var previews: some View {
        NewDateCourseView()
    }
}
