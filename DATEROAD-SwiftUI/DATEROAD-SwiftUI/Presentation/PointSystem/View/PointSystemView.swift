//
//  PointSystemView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct PointSystemView: View {
    
    // 현재 뷰의 상태를 관리하는 Environment 변수
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let pointSystemData: [PointSystemModel] = PointSystemModel.pointSystemData
    
    var attributedText: AttributedString {
        
        var string = AttributedString(POINTSYSTEM.MAINTITLE)
        
        let keywords = [POINTSYSTEM.POINT, POINTSYSTEM.DATECOURSE]
        
        for keyword in keywords {
            if let range = string.range(of: keyword) {
                string[range].foregroundColor = Color(.purple600)
            }
        }
        
        return string
    }
    
    var body: some View {
        ZStack {
            Color(.white000).ignoresSafeArea()
            VStack {
                Text(attributedText)
                    .setText(font: .title_extra_20,
                             padding: EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0),
                             lineLimit: 2)
                Text(POINTSYSTEM.SUBTITLE)
                    .setText(font: .body_med_15,
                             textColor: .gray500,
                             padding: EdgeInsets(top: 0, leading: 0, bottom: 26, trailing: 0))
                ForEach(pointSystemData, id: \.self) { systemData in
                    PointSystemItem(pointSystem: systemData)
                    .padding(.bottom, 16)
                }
                Spacer()
            }
            .customNavigationBar(hasLeftIcon: true, 
                                 hasCenterTitle: true,
                                 title: POINTSYSTEM.POINTSYSTEM,
                                 leftIconAction: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.horizontal, 16)
        }
    }
}

struct PointSystemItem: View {
    
    var pointSystem: PointSystemModel

    var body: some View {
        HStack {
            Image(pointSystem.illustration)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.leading, 12)
            VStack {
                Text(pointSystem.mainTitle)
                    .setText(font: .body_bold_15, lineLimit: 2)
                Spacer()
                Text(pointSystem.subTitle)
                    .setText(font: .body_med_13, textColor: .gray500)
            }
            .padding(.leading, 15)
            .padding(.vertical, 14)
            Spacer()
        }
        .frame(height: 98)
        .background(.gray100)
        .clipShape(RoundedCornerShape(corners: .allCorners, radius: 14))
    }
}

struct PointSystemView_Previews: PreviewProvider {
    static var previews: some View {
        PointSystemView()
    }
}
