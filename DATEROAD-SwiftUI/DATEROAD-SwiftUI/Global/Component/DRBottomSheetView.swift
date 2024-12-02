//
//  DRBottomSheetView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/26/24.
//

import SwiftUI

struct DRBottomSheetView<Content: View>: View {
    
    @Binding var isPresented: Bool
    
    let content: (Binding<Bool>) -> Content
    

    init(isPresented: Binding<Bool>, @ViewBuilder content: @escaping (Binding<Bool>) -> Content) {
        self._isPresented = isPresented
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented {
                Color(.black000)
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
            content($isPresented)
                .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.5), value: isPresented)
        }
        .ignoresSafeArea()
    }
}

struct DRLocationFilterView: View {
    
    @Binding var isPresented: Bool
    
    @State var isDisabled: Bool = true
    
    @State var selectedCountry: String = "서울"
    
    @State var selectedCity: String? = nil
        
    @State var cityData: [LocationFilter.City] = LocationFilter.Country.seoul.cities
    
    let countryData: [LocationFilter.Country] = LocationFilter.Country.allCases

    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                HStack {
                    Text(BOTTOM_SHEET.LOCATION_FILTER)
                        .setText(
                            font: .body_bold_17,
                            textColor: .black000,
                            padding: EdgeInsets(.zero)
                        )
                    Spacer()
                    Image(.btnClose)
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            // TODO: - 바텀 시트 닫기
                            isPresented = false
                        }
                }
                .frame(height: 40)
                .padding(EdgeInsets(top: 13, leading: 25, bottom: 29, trailing: 12))
            }
            
            Group {
                HStack(spacing: 8) {
                    ForEach(countryData, id: \.self) { country in
                        Text(country.rawValue)
                            .setText(
                                maxHeight: 33,
                                alignment: .center,
                                font: .body_semi_15,
                                textColor: selectedCountry == country.rawValue ? .white000 : .gray400
                            )
                            .frame(maxWidth: .infinity)
                            .background(selectedCountry == country.rawValue ? .purple600 : .gray100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                // TODO: - 지역 필터링
                                if selectedCountry != country.rawValue {
                                    selectedCountry = country.rawValue
                                    
                                    // 지역에 맞는 도시 데이터 세팅
                                    cityData = country.cities
                                    // 선택된 도시 및 하단 적용 버튼 초기화
                                    selectedCity = nil
                                    isDisabled = true
                                }
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 33)
            }
            .padding(.horizontal, 25)
            
            Color(.gray200)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(EdgeInsets(top: 18, leading: 25, bottom: 22, trailing: 25))
            
            Group {
                ChipLayoutView(
                    tagData: $cityData,
                    verticalSpacing: 11,
                    horizontalSpacing: 9
                ) { cityIndex in
                    let city = cityData[cityIndex]
                    Text(city.rawValue)
                        .setText(
                            maxWidth: nil,
                            maxHeight: 18,
                            font: .body_med_13,
                            textColor: selectedCity == city.rawValue ? .white000 : .gray400,
                            padding: EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14)
                        )
                        .background(selectedCity == city.rawValue ? .purple600 : .gray100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            // 적용하기 버튼 활성화
                            isDisabled = false
                            
                            // TODO: - 도시 필터링
                            if selectedCity != city.rawValue {
                                selectedCity = city.rawValue
                            }
                            
                        }
                }
            }
            .frame(height: 204)
            .padding(.horizontal, 25)
            
            Button(action: {
                
            }) {
                Text("적용하기")
                    .setText(
                        alignment: .center,
                        font: .body_bold_15,
                        textColor: isDisabled ? .gray400 : .white000
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: 54)
            .background(isDisabled ? .gray200 : .purple600)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(EdgeInsets(top: 16, leading: 25, bottom: 0, trailing: 25))
            .disabled(isDisabled)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 469)
        .background(.white000)
        .clipShape(RoundedCornerShape(corners: [.topRight, .topLeft], radius: 16))
    }
}
