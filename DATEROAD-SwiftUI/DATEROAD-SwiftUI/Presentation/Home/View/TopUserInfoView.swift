//
//  TopUserInfoView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/9/24.
//

import SwiftUI

struct TopUserInfoView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TopUserInfoView()
struct TicketView: View {
    
    @State var upcomingData: UpcomingDateModel
    
    var body: some View {
        ZStack {
            Image(.dateSchedule)
                .resizable(resizingMode: .stretch)
                .frame(height: 104)
                .padding(.horizontal, 16)
            HStack {
                VStack(alignment: .leading) {
                    Text(upcomingData.dDay == 0 ? "D-Day" : "D-\(upcomingData.dDay)")
                        .setText(maxWidth: nil,
                                 font: .cap_bold_11,
                                 textColor: .white000, 
                                 padding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .background(.purple600)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(upcomingData.dateName)
                        .setText(maxWidth: 259,
                                 font: .title_bold_20,
                                 textColor: .white000,
                                 padding: EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        .truncationMode(.tail)
                    HStack(spacing: 19) {
                        Text("\(upcomingData.month)월 \(upcomingData.day)일")
                            .setText(maxWidth: nil,
                                     font: .body_med_15,
                                     textColor: .purple400)
                        Text("\(upcomingData.startAt) 시작")
                            .setText(maxWidth: nil,
                                     font: .body_med_15,
                                     textColor: .purple400)
                    }
                }
                Spacer()
                Image(.icRightarrowPurple)
                    .frame(width: 44, height: 44)
                    .onTapGesture {
                        // TODO: - 데이트 일정 상세로 이동
                    }
            }
            .padding(.trailing, 27)
            .padding(.leading, 32)
        }
    }
}

}
