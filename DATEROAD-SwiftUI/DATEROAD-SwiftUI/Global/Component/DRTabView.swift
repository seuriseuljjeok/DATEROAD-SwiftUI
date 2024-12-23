//
//  DRTabView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/14/24.
//

import SwiftUI

struct DRTabView: View {
    
    @State private var selectedTab = 0
    
    init() {
        // 탭바 배경색 및 스타일 설정
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(resource: .white000) // 배경색 변경

        // 탭바 아이템 텍스트 색상 설정
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(resource: .gray300)] // 기본 색상
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(resource: .black000)] // 선택된 색상

        // 아이템 이미지 색상 설정
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(resource: .gray300) // 기본 색상
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(resource: .black000) // 선택된 색상

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
            VStack(spacing: 0) {
                // 선택된 탭 화면
                TabView(selection: $selectedTab) {
                        HomeView()
                            .tabItem {
                                Image(selectedTab == 0 ? .selectedHome : .defaultHome)
                                Text(TABBAR.HOME)
                                    .setText(alignment: .center, font: .cap_reg_11)
                            }
                            .tag(0)
                    CourseView()
                        .tabItem {
                            Image(selectedTab == 1 ? .selectedCourse : .defaultCourse)
                            Text(TABBAR.COURSE)
                                .setText(alignment: .center, font: .cap_reg_11)
                        }
                        .tag(1)
                    UpcomingDateScheduleView()
                        .tabItem {
                            Image(selectedTab == 2 ? .selectedSchedule : .defaultHome)
                            Text(TABBAR.DATE_SCHEDULE)
                                .setText(alignment: .center, font: .cap_reg_11)
                        }
                        .tag(2)
                    MyViewedCourseView()
                        .tabItem {
                            Image(selectedTab == 3 ? .selectedViewed : .defaultViewed)
                            Text(TABBAR.VIEWED_COURSE)
                                .setText(alignment: .center, font: .cap_reg_11)
                        }
                        .tag(3)
                    MyPageView()
                        .tabItem {
                            Image(selectedTab == 4 ? .selectedMypage : .defaultMypage)
                            Text(TABBAR.MY_PAGE)
                                .setText(alignment: .center, font: .cap_reg_11)
                        }
                        .tag(4)
                }
                
                // 커스텀 탭바
                Color(.gray100)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                
            }
            .ignoresSafeArea() // 탭바와 화면이 겹치지 않게 설정

    }
}


struct DRTabView_Previews: PreviewProvider {
    static var previews: some View {
        DRTabView()
    }
}
