//
//  TopUserInfoView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/9/24.
//

import SwiftUI

struct TopUserInfoView: View {
    
    // TODO: - [GET] 유저 정보
            
    @State var navigateToPointView: Bool = false
    
    @State private var userInfo: UserInfoModel = UserInfoModel(name: "희슬", point: 5555555, imageUrl: nil)
    
    @State private var upcomingData: UpcomingDateModel? = UpcomingDateModel.emptyData
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(.imgSmallLogo)
                    .padding(.leading, 11)
                    .frame(width: 55, height: 55)
                Spacer()
                ZStack(alignment: .trailing) {
                    Text(String(userInfo.point) + " P")
                        .setText(
                            maxWidth: nil,
                            font: .body_bold_13,
                            textColor: .white000,
                            padding: EdgeInsets(top: 7, leading: 14, bottom: 7, trailing: 40)
                        )
                    Image(userInfo.imageUrl ?? "empty_profile")
                        .frame(width: 33, height: 33)
                }
                .frame(height: 33)
                .background(.purple500)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 16)
                .onTapGesture {
                    print("tap")
                    navigateToPointView = true
                }
            }
            .frame(height: 55)
            if let upcomingData {
                TicketView(upcomingData: upcomingData)
            } else {
                EmptyTicketView()
            }
            Spacer()
            NavigationLink(
                destination: PointView(info: PointInfoModel(nickname: userInfo.name, point: userInfo.point)).navigationBarBackButtonHidden(),
                isActive: $navigateToPointView,
                label: { EmptyView() })
            .hidden()
        }
        .frame(height: 206)
        .background(.purple600)
    }
}

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
                        .setText(
                            maxWidth: nil,
                            font: .cap_bold_11,
                            textColor: .white000,
                            padding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10)
                        )
                        .background(.purple600)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(upcomingData.dateName)
                        .setText(
                            maxWidth: 259,
                            font: .title_bold_20,
                            textColor: .white000,
                            padding: EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0)
                        )
                        .truncationMode(.tail)
                    HStack(spacing: 19) {
                        Text("\(upcomingData.month)월 \(upcomingData.day)일")
                            .setText(
                                maxWidth: nil,
                                font: .body_med_15,
                                textColor: .purple400
                            )
                        Text("\(upcomingData.startAt) 시작")
                            .setText(
                                maxWidth: nil,
                                font: .body_med_15,
                                textColor: .purple400
                            )
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



struct EmptyTicketView: View {
    
    var body: some View {
        ZStack {
            Image(.dateSchedule)
                .resizable(resizingMode: .stretch)
                .frame(height: 104)
                .padding(.horizontal, 16)
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(HOME.EMPTY_TICKET_TITLE)
                        .setText(
                            maxWidth: nil,
                            font: .title_bold_18,
                            textColor: .white000
                        )
                    Text(HOME.EMPTY_TICKET_SUBTITLE)
                        .setText(
                            maxWidth: nil,
                            font: .body_med_15,
                            textColor: .purple400
                        )
                }
                Spacer()
                Image(.icPlusPurple)
                    .frame(width: 44, height: 44)
                    .onTapGesture {
                        // TODO: - 데이트 일정 등록으로 이동
                    }
            }
            .padding(.trailing, 28)
            .padding(.leading, 39)
        }
    }
}


struct TopUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TopUserInfoView()
    }
}
