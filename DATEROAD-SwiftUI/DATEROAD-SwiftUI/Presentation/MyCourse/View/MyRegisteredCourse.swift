//
//  MyRegisteredCourse.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/22/24.
//

import SwiftUI

struct MyRegisteredCourse: View {

struct CourseThumbnailView: View {
    
    var courseThumbnail: String
    
    var courseLike: Int
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(courseThumbnail)
                .resizable(resizingMode: .stretch)
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            ImageWithTextView(text: "\(courseLike)",
                              font: .body_bold_13,
                              imagePadding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0),
                              radius: 12,
                              viewPadding: EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
        }
    }
}

struct CourseInfoView: View {
    
    var courseLocation: String
    
    var courseTitle: String
    
    var courseCost: String
    
    var courseTime: String
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text(courseLocation)
                .setText(font: .body_med_13,
                         textColor: .gray400,
                         padding: EdgeInsets(top: 19, leading: 0, bottom: 5, trailing: 0))
            
            Text(courseTitle)
                .setText(font: .body_bold_15,
                         padding: EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0),
                         lineLimit: 2)
            HStack(spacing: 6) {
                ImageWithTextView(text: courseCost,
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_won",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
                ImageWithTextView(text: courseTime,
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_clock",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MyRegisteredCourse_Previews: PreviewProvider {
    static var previews: some View {
        MyRegisteredCourse()
    }
}
