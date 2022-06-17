import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                driveStartBtn
                VStack(spacing: 16) {
                    myCourseBtn
                    myPinBtn
                }
            }
            myFavoriteBtn
            RecentRecord(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.03.12", type: "핀", isFavorite: true)
                .padding()
            Spacer()
        }
    }
    
    // TODO: 디자인 픽스되면 버튼 View로 변경 예정
    var driveStartBtn: some View {
        NavigationLink(destination: EmptyView(), label: {
            Image("driveStart")
                .resizable()
                .frame(width: 204, height: 316)
                .shadow(color: .baseBlack.opacity(0.1), radius: 20, x: 6, y: 6)
        })
    }
    
    var myFavoriteBtn: some View {
        NavigationLink(destination: MyFavoriteView(), label: {
            Image("myFavorite")
                .resizable()
                .frame(width: 358, height: 104)
                .shadow(color: .baseBlack.opacity(0.1), radius: 20, x: 6, y: 6)
        })
    }
    
    var myCourseBtn: some View {
        NavigationLink(destination: MyCourseListView(), label: {
            Image("myCourse")
                .resizable()
                .frame(width: 138, height: 150)
                .shadow(color: .baseBlack.opacity(0.1), radius: 20, x: 6, y: 6)
        })
    }
    
    var myPinBtn: some View {
        NavigationLink(destination: LocationsView(), label: {
            Image("myPin")
                .resizable()
                .frame(width: 138, height: 150)
                .shadow(color: .baseBlack.opacity(0.1), radius: 20, x: 6, y: 6)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
