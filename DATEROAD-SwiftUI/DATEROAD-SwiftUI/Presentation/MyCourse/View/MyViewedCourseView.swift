//
//  MyViewedCourse.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/13/24.
//

import SwiftUI

struct MyViewedCourseView: View {
    
    // MARK: - Property
    
    @State var nickname: String = "희슬"
    
    @State private var courseData: [MyCourseModel] = MyCourseModel.dummyData

    // MARK: - Body
    
    var body: some View {
        List($courseData, id: \.self) { course in
            HorizontalCourseItem(course: course)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(.zero))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 21))
        }
        .listStyle(.plain)
    }
    
    private var TopCouseCountInfoView: some View {
        VStack {
            Text("\(nickname)님이 지금까지\n열람한 데이트 코스\n\(courseData.count)개")
        }
    }
}


struct MyViewedCourse_Previews: PreviewProvider {
    static var previews: some View {
        MyViewedCourseView()
    }
}
