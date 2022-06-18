//
//  CountDownView.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/16.
//
import SwiftUI

struct CountDownView: View {
    @Binding var firstNaviLinkActive: Bool
    
    @State private var timeRemaining = 5
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.baseBlack.ignoresSafeArea()
            VStack {
                Text("곧 주행 기록이 시작됩니다")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.top, 216.0)
                Text("\(timeRemaining)")
                    .font(.system(size: 150, weight: .medium))
                    .foregroundColor(.mainBlue)
                    .padding(.top, 76)
                Button(action: {
                    isActive = false
                    firstNaviLinkActive = false
                }, label: {
                    Text("드라이브 취소")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 45, bottom: 16, trailing: 45))
                        .background(Color.mainBlue)
                        .clipShape(Capsule())
                })
                Spacer()
            }
            .ignoresSafeArea()
            if(timeRemaining < 1) {
                RecordingView(firstNaviLinkActive: $firstNaviLinkActive)
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView(firstNaviLinkActive: .constant(true))
    }
}
