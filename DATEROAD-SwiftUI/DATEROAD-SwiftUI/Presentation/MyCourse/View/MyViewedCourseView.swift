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
        VStack(spacing: 0) {
            TopCouseCountInfoView
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 11, trailing: 16))
            
            if courseData.count != 0 {
                List($courseData, id: \.self) { course in
                    HorizontalCourseItem(course: course)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(.zero))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 21))
                }
                .listStyle(.plain)
            } else {
                DREmptyView(
                    image: Image(.emptyViewedCourse),
                    title: EMPTY.VIEWED_COURSE,
                    paddingFromTop: 41
                )
            }
        }
    }
    
    
    // MARK: - SubView
    
    private var TopCouseCountInfoView: some View {
        
        var attributedText: AttributedString {
            
            let string = "\(nickname)님이 지금까지\n열람한 데이트 코스\n\(courseData.count)개"
            var attributedString = AttributedString(string)
            
            if let range = attributedString.range(of: "\(courseData.count)") {
                attributedString[range].foregroundColor = .purple600
            }
            
            return attributedString
        }
        
        return VStack {
            if courseData.count != 0 {
                Text(attributedText)
                    .setText(font: .title_extra_24, lineLimit: 3)
                HStack(spacing: 10) {
                    Text(MYCOURSE.CREATE_DATE_WITH_VIEWED_COURSE)
                        .setText(maxWidth: nil, font: .title_bold_18)
                    Button(action: {}) {
                        Image(.rightLongArrow)
                    }
                    .frame(width: 45, height: 26)
                    .background(.purple600)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                }
            } else {
                Text("\(nickname)님\n아직 열람한\n데이트 코스가 없어요")
                    .setText(font: .title_extra_24, lineLimit: 3)
            }
        }
    }
}


struct MyViewedCourse_Previews: PreviewProvider {
    static var previews: some View {
        MyViewedCourseView()
    }
}
