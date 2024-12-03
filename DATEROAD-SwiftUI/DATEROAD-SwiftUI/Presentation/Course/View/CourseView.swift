//
//  CourseView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/19/24.
//

import SwiftUI

struct CourseView: View {
    
    @State var courseListData: [CourseListModel] = []

    @State private var isPresentedBottomSheet: Bool = false
    
    @State private var selectedCountry: String = "서울"
    
    @State private var selectedCity: String? = nil

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(.white000)
                VStack {
                    CourseFilteringView(selectedCity: $selectedCity, isPresentedBottomSheet: $isPresentedBottomSheet)
                    CourseListView(courseListData: $courseListData)
                }
                DRBottomSheetView(
                    isPresented: $isPresentedBottomSheet,
                    selectedCountry: $selectedCountry,
                    selectedCity: $selectedCity
                ) { isPresented, selectedCountry, selectedCity in
                    DRLocationFilterView(
                        isPresented: isPresented,
                        selectedCountry: selectedCountry,
                        selectedCity: selectedCity
                    )
                }
            }
            .customNavigationBar(
                hasRightIcon: true,
                hasLeftTitle: true,
                title: COURSE.LOOK_AROUND_COURSE,
                rightIconAction:  {
                    // TODO: - 코스 등록하기 이동
                })
        }
    }
    
}


private struct CourseFilteringView: View {
    
    @Binding var selectedCity: String?
    
    @State var selectedIndex: Int? = nil
    
    @Binding var isPresentedBottomSheet: Bool
    
    let priceFilter: [String] = [PRICETAG.UNDER30K, PRICETAG.UNDER50K, PRICETAG.UNDER100K, PRICETAG.OVER100K]
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HStack {
                Group {
                    HStack {
                        Text(selectedCity ?? COURSE.LOCATION)
                            .setText(
                                font: .body_med_13,
                                textColor: .gray400,
                                padding: EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 0)
                            )
                        Spacer()
                        Button(action: {
                            isPresentedBottomSheet = true
                        }) {
                            Image(.icDropdown)
                        }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))

                    }
                }
                .frame(width: 150, height: 30)
                .background(.gray100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Button(
                    action: {
                        selectedIndex = nil
                        print("tap")
                    }
                ) {
                    Image(.btnResetIos)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
            .onTapGesture {
                // TODO: - 지역 필터 바텀시트 띄우기
            }
            .frame(height: 44)
            HStack(spacing: 8) {
                ForEach(priceFilter.indices, id: \.self) { index in
                    Text(priceFilter[index])
                        .setText(
                            alignment: .center,
                            font: .body_med_13,
                            textColor: selectedIndex == index ? .white000 : .gray400,
                            padding: EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0)
                        )
                        .frame(height: 30)
                        .background(selectedIndex == index ? .purple600 : .gray100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            // TODO: - 필터링된 가격에 따라 서버 통신
                            print(String((index+1).costNum()))
                            if selectedIndex == index {
                                // 선택해제
                                selectedIndex = nil
                            } else {
                                selectedIndex = index
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(EdgeInsets(top: 9, leading: 0, bottom: 20, trailing: 0))
    }
}


private struct CourseListView: View {
    
    @Binding var courseListData: [CourseListModel]
    
    let columns = [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)]
    
    var body: some View {
        GeometryReader { geometry in
            let width = (geometry.size.width - 47) / 2
            let height = geometry.size.height
            
            if courseListData.isEmpty {
                DREmptyView(
                    image: Image(.emptyCourseList),
                    title: EMPTY.COURSE,
                    paddingFromTop: height * 0.0517
                )
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach($courseListData, id: \.courseId) { data in
                            CourseListItem(
                                courseData: data,
                                width: width,
                                height: height
                            )
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

private struct CourseListItem: View {
    
    @Binding var courseData: CourseListModel
    
    @State var width: CGFloat

    @State var height: CGFloat
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack(alignment: .bottomLeading) {
                
                Image(courseData.thumbnail)
                    .resizable()
                    .frame(width: width, height: width * 0.8536)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                
                ImageWithTextView(
                    text: String(courseData.like),
                    font: .body_bold_13,
                    imagePadding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0),
                    radius: 12,
                    viewPadding: EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
                
            }
            
            Text(courseData.location)
                .setText(
                    alignment: .leading,
                    font: .body_med_13,
                    textColor: .gray400,
                    padding: EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                )
            
            Text(courseData.title)
                .frame(
                    maxWidth: .infinity,
                    minHeight: 43,
                    alignment: .topLeading
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .font(.suit(.body_bold_17))
                .lineLimit(2)
                .foregroundStyle(.black000)
            
            HStack(spacing: 18) {
                ImageWithTextView(
                    text: courseData.cost.priceRangeTag(),
                    textPadding: EdgeInsets(.zero),
                    font: .body_med_13,
                    textColor: .gray400,
                    image: "ic_won",
                    imagePadding: EdgeInsets(top: 1.5, leading: 0, bottom: 1.5, trailing: 0),
                    backgroundColor: .white000,
                    radius: 20,
                    viewPadding: EdgeInsets(.zero)
                )
                ImageWithTextView(
                    text: courseData.time.formatFloatTime() + "시간",
                    textPadding: EdgeInsets(.zero),
                    font: .body_med_13,
                    textColor: .gray400,
                    image: "ic_clock",
                    imagePadding: EdgeInsets(top: 1.5, leading: 0, bottom: 1.5, trailing: 0),
                    backgroundColor: .white000,
                    radius: 20,
                    viewPadding: EdgeInsets(.zero)
                )
            }
            .frame(width: width, alignment: .leading)
        }
        .frame(width: width, height: width * 1.378)
        .onTapGesture {
            // TODO: - 코스 상세로 이동
        }
    }
}

struct CourseView_Preview: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
