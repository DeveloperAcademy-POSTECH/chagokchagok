import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                driveStartBtn
                myFavoriteBtn
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 16, trailing: 20))
            
            HStack {
                myCourseBtn
                myPinBtn
            }
            .padding(.horizontal, 20)
            recentRecord()
            Spacer()
        }
    }
    
    var driveStartBtn: some View {
        NavigationLink(destination: EmptyView(), label: {
            Image("tempDriveStart")
                .resizable()
                .frame(width: 222, height: 276)
        })
    }
    
    var myFavoriteBtn: some View {
        NavigationLink(destination: EmptyView(), label: {
            Image("tempMyFavorite")
                .resizable()
                .frame(width: 116, height: 276)
        })
    }
    
    var myCourseBtn: some View {
        NavigationLink(destination: EmptyView(), label: {
            Image("tempMyCourse")
                .resizable()
                .frame(width: 171, height: 130)
        })
    }
    
    var myPinBtn: some View {
        NavigationLink(destination: EmptyView(), label: {
            Image("tempMyPin")
                .resizable()
                .frame(width: 171, height: 130)
        })
    }
    
    private func recentRecord() -> some View {
        ZStack {
            VStack {
                HStack {
                    Text("최근 추가된 드라이브")
                        .recentListTitleStyle()
                        .recentRecordListStyle()
                    NavigationLink(destination: EmptyView(), label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15, height: 24)
                            .padding(.horizontal, 18)
                    })
                }
                RecentRecordCell(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.03.12", type: "핀", isFavorite: true)
                    .padding(.bottom, 18)
                RecentRecordCell(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.07.02", type: "핀", isFavorite: true)
                Spacer()
            }
        }
        .frame(width: 358, height: 214)
        .background(.gray)
        .cornerRadius(12)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
