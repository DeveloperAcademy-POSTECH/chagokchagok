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
                    Spacer()
                    Text("최근 추가된 드라이브")
                        .font(.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀", isFavorite: true)
            }
        }
        .frame(width: 358, height: 214)
        .background(.red)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
