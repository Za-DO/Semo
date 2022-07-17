//
//  TuneView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct TuneView: View {
    @State var gender = 1
    
    var body: some View {
        VStack {
            // MARK: - 남/여/혼성 세그먼트
            HStack {
                Text("키")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.grayScale2)
                    .padding([.top, .leading], 20)
                Spacer()
            }
            Picker("pick gender", selection: $gender, content: {
                Text("여성").tag(0)
                Text("혼성").tag(1)
                Text("남성").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
            // MARK: - 키 picker
            // TODO: - pickerView 가져오기
            Spacer()
                .frame(height: 102)
        }
    }
}

struct TuneView_Previews: PreviewProvider {
    static var previews: some View {
        TuneView().preferredColorScheme(.dark)
    }
}
