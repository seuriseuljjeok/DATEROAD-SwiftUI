//
//  UpcomingDateScheduleView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/10/24.
//

import SwiftUI


struct UpcomingDateScheduleView: View {
    
    // MARK: - Property
    
    @State var dateScheduleData: [DateCardModel] = DateCardModel.dummyData
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white000)
                    .ignoresSafeArea()
                if dateScheduleData.count == 0 {
                    DREmptyView(
                        image: Image(.emptyRegisteredCourse),
                        title: EMPTY.DATE_SCHEDULE,
                        paddingFromTop: UIScreen.main.bounds.size.height / 812 * 23
                    )
                } else {
                    DateCardView(dateScheduleData: $dateScheduleData)
                }
                
                ViewPastDateScheduleButton
                    .padding(.top, UIScreen.main.bounds.size.height / 812 * 463)
            }
            .customNavigationBar(
                hasRightIcon: true,
                hasLeftTitle: true,
                title: DATESCHEDULE.DATE_SCHEDULE
            )
        }
    }
    
    
    // MARK: - SubView
    
    private var ViewPastDateScheduleButton: some View {
        
        Button(action: {}) {
            Text(DATESCHEDULE.SHOW_PAST_DATE_SCHEDULE)
                .setText(
                    maxWidth: nil,
                    alignment: .center,
                    font: .body_bold_15,
                    padding: EdgeInsets(top: 11.5, leading: 39, bottom: 11.5, trailing: 39)
                )
                .background(.gray100)
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        
    }
}

struct DateCardView: View {
    
    // MARK: - Property
    
    @State var currentIndex: Int = 0
    
    @Binding var dateScheduleData: [DateCardModel]
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentIndex) {
                ForEach(Array(dateScheduleData.enumerated()), id: \.element.dateID) { index, data in
                    let (ticketImage, tagColor) = setCardStyle(index: index + 1)
                    
                    DateCardItem(
                        ticketImage: ticketImage,
                        tagBackgroundColor: tagColor,
                        currentIndex: $currentIndex,
                        dateScheduleData: .constant(data)
                    )
                    .padding(.horizontal, UIScreen.main.bounds.size.width / 375 * 42)
                    .tag(index)
                }
            }
            .frame(height: UIScreen.main.bounds.height / 812 * 406)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.top, UIScreen.main.bounds.size.height / 812 * 75)
            .padding(.bottom, UIScreen.main.bounds.size.height / 812 * 28)
            
            CustomIndicator
            
            Spacer()
            
        }
    }
    
    
    // MARK: - SubView
    
    private var CustomIndicator: some View {
        
        HStack(alignment: .center, spacing: 8) {
            ForEach(0 ..< dateScheduleData.count, id: \.self) {indicator in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(currentIndex == indicator ? .purple600 : .gray200)
            }
        }
        
    }
    
    
    // MARK: - Methods
    
    func setCardStyle(index: Int) -> (Image, Color) {
        switch index % 3 {
        case 0:
            return (Image(.btnCardLime), .lime100)
        case 1:
            return (Image(.btnCardPink), .pink100)
        case 2:
            return (Image(.btnCardPurple), .purple100)
        default:
            return (Image(.btnCardPink), .pink100)
        }
    }
}


struct DateCardItem: View {
    
    // MARK: - Property
    
    @State var ticketImage: Image
    
    @State var tagBackgroundColor: Color
    
    @Binding var currentIndex: Int
    
    @Binding var dateScheduleData: DateCardModel
        
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            ticketImage
                .resizable()
            
            TopDateContainer
                .padding(.horizontal, 20)
            
            TagContainer
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 20,
                        bottom: UIScreen.main.bounds.size.height * 0.1958,
                        trailing: 0
                    )
                )
            
            DateInfoContainer
                .padding(.horizontal, 20)
        }
        .frame(height: UIScreen.main.bounds.size.height * 0.5)
    }
    
    // MARK: - SubView
    
    private var TopDateContainer: some View {
        
        HStack(alignment: .top) {
            Text(dateScheduleData.date.toReadableDate() ?? "")
                .setText(
                    maxWidth: nil,
                    alignment: .leading,
                    font: .title_extra_24,
                    lineLimit: 2
                )
            Spacer()
            Text(dateScheduleData.dDay == 0 ? DATESCHEDULE.D_DAY : "D-\(dateScheduleData.dDay)")
                .setText(
                    maxWidth: nil,
                    font: .cap_bold_11,
                    textColor: .white000,
                    padding: EdgeInsets(
                        top: 2,
                        leading: 10,
                        bottom: 2,
                        trailing: 10
                    )
                )
                .background(.purple600)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(.top, 20)

    }
    
    private var TagContainer: some View {
                
        func setTagLayout(tagIndex: Int) -> (Angle, EdgeInsets) {
            switch tagIndex {
            case 0:
                return (Angle(degrees: 0), EdgeInsets(.zero))
            case 1:
                return (Angle(degrees: 15), EdgeInsets(top: 0, leading: 75, bottom: 39, trailing: 0))
            case 2:
                return (Angle(degrees: -12), EdgeInsets(top: 0, leading: 18, bottom: 69, trailing: 0))
            default:
                return (Angle(degrees: 0), EdgeInsets(.zero))
            }
        }
        
        return ZStack(alignment: .bottomLeading) {
            Color(.clear)
            ForEach(0 ..< dateScheduleData.tags.count, id: \.self) { tagIndex in
                let (angle, padding) = setTagLayout(tagIndex: tagIndex)
                ImageWithTextView(
                    spacing: 2,
                    text: TendencyTag.getTag(byEnglish: dateScheduleData.tags[tagIndex])?.tag.tagTitle ?? "",
                    textPadding: EdgeInsets(
                        top: 4,
                        leading: 0,
                        bottom: 4,
                        trailing: 10
                    ),
                    font: .body_semi_15,
                    textColor: .black000,
                    image: TendencyTag.getTag(byEnglish: dateScheduleData.tags[tagIndex])?.tag.tagIcon ?? "",
                    imagePadding: EdgeInsets(
                        top: 4,
                        leading: 10,
                        bottom: 4,
                        trailing: 2
                    ),
                    backgroundColor: tagBackgroundColor,
                    radius: 20,
                    viewPadding: EdgeInsets(.zero)
                )
                .padding(padding)
                .rotationEffect(angle)
            }
        }
    }
    
    private var DateInfoContainer: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(dateScheduleData.city)
                .setText(font: .body_med_15, textColor: .gray500)
            Text(dateScheduleData.title)
                .setText(
                    font: .title_extra_24,
                    textColor: .black000,
                    lineLimit: 2
                )
        }
        .padding(.top, UIScreen.main.bounds.size.height / 812 * 290)
    }
    
}

struct UpcomingDateSchedulePreview: PreviewProvider {
    
    static var previews: some View {
        UpcomingDateScheduleView()
    }
}
