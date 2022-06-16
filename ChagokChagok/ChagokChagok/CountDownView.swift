//
//  CountDownView.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/16.
//
import SwiftUI

struct CountDownView: View {
    @State private var timeRemaining = 5
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showAlert = false
    
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
                    showAlert = true
                    isActive = false
                }, label: {
                    Text("드라이브 취소")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 45, bottom: 16, trailing: 45))
                        .background(Color.mainBlue)
                        .clipShape(Capsule())
                })
                .alert("드라이브를 취소하시겠습니까?", isPresented: $showAlert) {
                    Button("취소") {
                        // TODO: ContentView로 가기
                    }
                    Button("돌아가기", role: .cancel) {
                        isActive = true
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
            if(timeRemaining < 1) {
                RecordingView()
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
        CountDownView()
    }
}
