//
//  PointView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/23/24.
//

import SwiftUI

struct PointView: View {
    var body: some View {
        ZStack {
            Color(.white000)
                .ignoresSafeArea()
            VStack {
                PointInfoView
                    .padding(EdgeInsets(top: 21, leading: 16, bottom: 20, trailing: 16))
        }
        .customNavigationBar(
            hasLeftIcon: true,
            hasCenterTitle: true ,
            title: POINT.POINT_HISTORY,
            leftIconAction: {
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    
    // MARK: - SubView
    
    private var PointInfoView: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(info.nickname + " 님의 포인트")
                .setText(
                    font: .body_med_13,
                    textColor: .white000,
                    padding: EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0)
                )
            Text("\(info.point) P")
                .setText(
                    font: .title_extra_24,
                    textColor: .white000,
                    padding: EdgeInsets(top: 0, leading: 16, bottom: 14, trailing: 0)
                )
        }
        .frame(height: 90)
        .background(.purple600)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    }
}

struct PointView_Preview: PreviewProvider {
    static var previews: some View {
        return PointView(info: PointInfoModel(nickname: "희슬", point: 100000))
    }
}
