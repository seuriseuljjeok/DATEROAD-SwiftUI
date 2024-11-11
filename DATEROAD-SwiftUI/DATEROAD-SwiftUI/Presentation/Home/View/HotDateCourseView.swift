
struct HotDateCourseItem: View {
    
    var hotCourseData: DateCourseModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(hotCourseData.city)
                .setText(
                    maxWidth: nil,
                    maxHeight: 26,
                    font: .body_med_13,
                    textColor: .white000, 
                    padding: EdgeInsets(top: 4, leading: 13, bottom: 4, trailing: 13)
                )
                .background(.purple500)
                .clipShape(RoundedCornerShape(corners: [.topRight, .topLeft], radius: 12))
            ZStack(alignment: .bottomLeading) {
                Image(.emptyCourse)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 238, height: 238)
                    .clipShape(RoundedCornerShape(corners: [.topRight, .bottomLeft], radius: 14))
                ImageWithTextView(
                    text: String(hotCourseData.like),
                    font: .body_bold_13,
                    imagePadding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0),
                    radius: 12,
                    viewPadding: EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
            }
            Text(hotCourseData.title)
                .frame(width: 238, height: 48, alignment: .topLeading)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0))
                .font(.suit(.body_bold_17))
                .lineLimit(2)
                .foregroundStyle(.black000)
            HStack(spacing: 6) {
                ImageWithTextView(text: hotCourseData.cost.priceRangeTag(),
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_won",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
                ImageWithTextView(text: hotCourseData.duration + "시간",
                                  textPadding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 10),
                                  font: .body_med_13,
                                  textColor: .gray400,
                                  image: "ic_clock",
                                  imagePadding: EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 0),
                                  backgroundColor: .gray100,
                                  radius: 20,
                                  viewPadding: EdgeInsets(.zero))
            }
        }
        .frame(width: 238, height: 356)
        .onTapGesture {
            // TODO: - 코스 상세로 이동
        }
    }
}

