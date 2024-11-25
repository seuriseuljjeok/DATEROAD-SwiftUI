//
//  DRBottomSheetView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/26/24.
//

import SwiftUI

struct DRBottomSheetView<Content: View>: View {
    
    let content: Content
    

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.black000)
                .opacity(0.4)
                .ignoresSafeArea()
            content
        }
        .ignoresSafeArea()
    }
}

struct DRLocationFilterView: View {
    
    @State var selectedCountry: String = "서울"
    
    let countryData: [LocationFilter.Country] = LocationFilter.Country.allCases
    
    @State var cityData: [LocationFilter.City.Seoul] = LocationFilter.City.Seoul.allCases
    
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
                            textColor: .gray400,
                            padding: EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14)
                        )
                        .background(.gray100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
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
                        textColor: .gray400
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: 54)
            .background(.gray200)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(EdgeInsets(top: 16, leading: 25, bottom: 0, trailing: 25))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 469)
        .background(.white000)
        .clipShape(RoundedCornerShape(corners: [.topRight, .topLeft], radius: 16))
    }
}

struct DRBottomSheetView_Preview: PreviewProvider {
    static var previews: some View {
        return DRBottomSheetView { DRLocationFilterView() }
    }
}
