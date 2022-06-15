import SwiftUI

struct RecentRecord: View {
    var image: String
    var name: String?
    var memo: String?
    var createTime: String
    var type: String
    var isFavorite: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("최근 추가된 드라이브")
                        .recentListTitleStyle()
                        .recentListViewStyle()
                    NavigationLink(destination: EmptyView(), label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15, height: 24)
                            .padding(.horizontal, 18)
                    })
                }
                // TODO: 최근 데이터 두개 불러와서 Foreach로 cell 두 개 뿌려주기
                recentRecordCell
                recentRecordCell
                Spacer()
            }
        }
        .frame(width: 358, height: 214)
        .background(.gray)
        .cornerRadius(12)
    }
    
    var recentRecordCell: some View {
        HStack {
            Image(image)
                .recentListIconStyle()
            VStack(alignment: .leading, spacing: 0) {
                // TODO: 핀1,2,, 핀을 고유값을 붙이던가 시간단위까지 하던가 구분할 수 있는 요소 추가해야 함
                Text("\(createTime) \(type)")
                    .listTitleStyle()
                    .padding(.bottom, 8)
                Text(memo != nil ? "\(memo!)" : "메모를 입력해주세요.")
                    .listMemoStyle()
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 18, bottom: 18, trailing: 18))
    }
}

struct RecentRecord_Previews: PreviewProvider {
    static var previews: some View {
        RecentRecord(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.03.12", type: "핀", isFavorite: true)
            .previewLayout(.sizeThatFits)
    }
}
