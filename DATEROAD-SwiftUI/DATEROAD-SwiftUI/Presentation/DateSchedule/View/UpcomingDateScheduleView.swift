//
//  UpcomingDateScheduleView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/10/24.
//

import SwiftUI

struct UpcomingDateScheduleView: View {
    
    @State var dateScheduleData: [DateCardModel] = DateCardModel.dummyData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white000)
                    .ignoresSafeArea()
            }
            .customNavigationBar(
                hasRightIcon: true,
                hasLeftTitle: true,
                title: DATESCHEDULE.DATE_SCHEDULE
            )
        }
    }
}
