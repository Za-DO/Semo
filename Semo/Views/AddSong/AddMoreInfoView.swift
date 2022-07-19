//
//  AddMoreInfoView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/19.
//

import SwiftUI

struct AddMoreInfoView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.sampleBlack]),                         startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
                .edgesIgnoringSafeArea(.all)
            // MARK: - 추가 정보 입력란
            VStack(alignment: .center) {
                Text("노래방에서 필요한 정보를 \n입력하세요.")
                    .lineSpacing(10)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(EdgeInsets(top: 14, leading: 20, bottom: 0, trailing: 0))
                LevelPickerView()
                    .padding(.top, 60)
                TunePickerView()
                Spacer()
                
                // TODO: - 데이터 저장하기
                NavigationLink(destination: TestDetailView()) {
                    ConfirmButtonView(buttonName: "확인")
                }
                .navigationTitle("")
                Button {
                    print("기본 데이터만 저장하고 다음 단계로 이동")
                } label: {
                    Text("건너뛰기")
                        .foregroundColor(.grayScale1)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 28, leading: 0, bottom: 60, trailing: 0))
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct AddMoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoreInfoView()
    }
}