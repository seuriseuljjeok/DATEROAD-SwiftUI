//
//  HotDateCourseView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/11/24.
//

import SwiftUI

struct HotDateCourseView: View {
    
    @State var nickname: String = "췣췣췣췣췣"
    
    @State var hotDateCourseData: [DateCourseModel] = DateCourseModel.emptyData
    
    var body: some View {
        ZStack {
            Color(.white000)
                .ignoresSafeArea()
                .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 20))
            VStack(spacing: 0) {
                HotDateCourseTitleView(nickname: $nickname)
                HotDateCourseListView(hotCourseData: $hotDateCourseData)
            }
        }
    }
}

struct HotDateCourseTitleView: View {
    
    @Binding var nickname: String
    
    var attributedText: AttributedString {
        
        var string = AttributedString(nickname + "님," + HOME.HOT_DATE_TITLE)
        
        let keyword = nickname + "님,"
        
        if let range = string.range(of: keyword) {
            string[range].foregroundColor = Color(.purple600)
        }
        
        return string
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(attributedText)
                .frame(
                    maxWidth: .infinity,
                    minHeight: 62,
                    alignment: .leading
                )
                .lineLimit(2)
                .font(Font.system(size: 24, weight: .black))
                .padding(EdgeInsets(top: 21, leading: 16, bottom: 0, trailing: 16))
            HStack {
                Text(HOME.HOT_DATE_SUB_TITLE)
                    .setText(font: .body_med_13, textColor: .gray400)
                Spacer()
                Text(HOME.GO_TO_DATE)
                    .setText(
                        maxWidth: 35,
                        maxHeight: 18,
                        font: .body_bold_13,
                        textColor: .purple500
                    )
            }
            .padding(EdgeInsets(top: 6, leading: 16, bottom: 12, trailing: 20))
        }
    }
}

struct HotDateCourseListView: View {
    
    @Binding var hotCourseData: [DateCourseModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(hotCourseData, id: \.courseId) { data in
                    HotDateCourseItem(hotCourseData: data)
                        .padding(.leading, 16)
                }
            }
        }
    }
}

struct HotDateCourseItem: View {
    
    var hotCourseData: DateCourseModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(hotCourseData.city)
                .setText(
                    maxWidth: nil,
                    maxHeight: 26,
                    font: .body_med_13,
                    textColor: .white000, 
                    padding: EdgeInsets(top: 4, leading: 13, bottom: 4, trailing: 13)
                )
                .background(.purple500)
                .clipShape(RoundedCornerShape(corners: [.topRight, .topLeft], radius: 12))
            ZStack(alignment: .bottomLeading) {
                Image(.emptyCourse)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 238, height: 238)
                    .clipShape(RoundedCornerShape(corners: [.topRight, .bottomLeft], radius: 14))
                ImageWithTextView(
                    text: String(hotCourseData.like),
                    font: .body_bold_13,
                    imagePadding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0),
                    radius: 12,
                    viewPadding: EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
            }
            Text(hotCourseData.title)
                .frame(width: 238, height: 48, alignment: .topLeading)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0))
                .font(.suit(.body_bold_17))
                .lineLimit(2)
                .foregroundStyle(.black000)
            HStack(spacing: 6) {
                ImageWithTextView(text: hotCourseData.cost.priceRangeTag(),
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_won",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
                ImageWithTextView(text: hotCourseData.duration + "시간",
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_clock",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
            }
        }
        .frame(width: 238, height: 356)
        .onTapGesture {
            // TODO: - 코스 상세로 이동
        }
    }
}

struct HotDateCourseView_Previews: PreviewProvider {
    static var previews: some View {
        HotDateCourseView()
    }
}
