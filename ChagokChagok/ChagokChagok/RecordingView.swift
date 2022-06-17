//
//  RecordingView.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/16.
//

import SwiftUI

struct RecordingView: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        ZStack {
            Color.baseBlack.ignoresSafeArea()
            VStack {
                Text("운전 중에는 휴대폰을 멀리하세요")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.top, 216.0)
                Button(action: {
                    firstNaviLinkActive = false
                }, label: {
                    Text("드라이브 종료")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 45, bottom: 16, trailing: 45))
                        .background(Color.mainBlue)
                        .clipShape(Capsule())
                })
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(firstNaviLinkActive: .constant(true))
    }
}
