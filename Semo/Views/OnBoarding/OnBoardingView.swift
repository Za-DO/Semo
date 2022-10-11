//
//  OnBoardingView.swift
//  Semo
//
//  Created by Terry Koo on 2022/10/03.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("LaunchScreenImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    Text("노래방에서 부르고 싶은 노래\n기록하고 기억하세요")
                        .multilineTextAlignment(.center) //여러줄의 텍스트 표시 정렬방식
                        .lineSpacing(10) //텍스트 줄간격 조절
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .opacity(0.5)
                }
                .padding(EdgeInsets(top: UIScreen.getHeight(100), leading: 0, bottom: 0, trailing: 0))
                VStack {
                    Spacer()
                    StartButton(buttonName: "노래 기록하러 가기", buttonWidth: 152, buttonHeight: 42, buttonAction: {})
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: UIScreen.getHeight(70), trailing: 0))
            }
        }
    }
        
    
    @ViewBuilder
    func StartButton(buttonName: String, buttonWidth: CGFloat, buttonHeight: CGFloat, buttonAction: @escaping () -> Void) -> some View {
        
        Button {
            buttonAction()
        } label: {
            Text(buttonName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.grayScale1)
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .stroke(Color.grayScale1, lineWidth: 1)
                        .frame(width: buttonWidth, height: buttonHeight)
                        .opacity(0.2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .frame(width: buttonWidth, height: buttonHeight)
                        .foregroundColor(.grayScale1)
                        .opacity(0.1)
                )
        }
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
