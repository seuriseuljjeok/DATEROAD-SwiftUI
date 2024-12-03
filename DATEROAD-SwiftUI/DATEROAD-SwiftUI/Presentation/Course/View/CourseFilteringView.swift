//
//  CourseFilteringView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/4/24.
//

private struct CourseFilteringView: View {
    
    @Binding var selectedCity: String?

    @Binding var selectedCountry: String?
            
    @Binding var isPresentedBottomSheet: Bool
    
    @State var selectedIndex: Int? = nil
    
    let priceFilter: [String] = [PRICETAG.UNDER30K, PRICETAG.UNDER50K, PRICETAG.UNDER100K, PRICETAG.OVER100K]
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HStack {
                Group {
                    HStack {
                        Text(selectedCity ?? COURSE.LOCATION)
                            .setText(
                                font: .body_med_13,
                                textColor: selectedCity != nil ? .purple600 : .gray400,
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
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedCity != nil ? Color.purple600 : Color.white000, lineWidth: 1)
                )
                .onTapGesture {
                    isPresentedBottomSheet = true
                }
                Spacer()
                Button(
                    action: {
                        selectedIndex = nil
                        selectedCity = nil
                        selectedCountry = "서울"
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
