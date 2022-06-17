import SwiftUI

struct MainView: View {
    @Binding var firstNaviLinkActive : Bool
    var body: some View {
        VStack {
            HStack {
                driveStartBtn
                myFavoriteBtn
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            
            HStack {
                myCourseBtn
                myPinBtn
            }
            .padding(.horizontal, 16)
            RecentRecord(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.03.12", type: "핀", isFavorite: true)
                .padding()
            Spacer()
        }
    }
    
    // TODO: 디자인 픽스되면 버튼 View로 변경 예정
    var driveStartBtn: some View {
        NavigationLink(destination: CountDownView(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive) {
            Image("tempDriveStart")
                .resizable()
                .frame(width: 222, height: 276)
        }
    }
    
    var myFavoriteBtn: some View {
        NavigationLink(destination: MyFavoriteView(), label: {
            Image("tempMyFavorite")
                .resizable()
                .frame(width: 116, height: 276)
        })
    }
    
    var myCourseBtn: some View {
        NavigationLink(destination: MyCourseListView(), label: {
            Image("tempMyCourse")
                .resizable()
                .frame(width: 171, height: 130)
        })
    }
    
    var myPinBtn: some View {
        NavigationLink(destination: LocationsView(), label: {
            Image("tempMyPin")
                .resizable()
                .frame(width: 171, height: 130)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(firstNaviLinkActive: .constant(true))
    }
}
