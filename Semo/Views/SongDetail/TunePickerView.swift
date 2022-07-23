//
//  TuneView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct TunePickerView: View {
    var genders = ["여성", "혼성", "남성"]
    var tunes = ["-6", "-5", "-4", "-3", "-2", "-1",
                         "0", "1", "2", "3", "4", "5", "6"]
    @State var gender = "혼성"
    @State var tune = "0"
    
    var body: some View {
        VStack {
            // MARK: - 남/여/혼성 세그먼트
            HStack {
                ContentsTitleView(titleName: "키")
                Spacer()
            }
            Picker("pick gender", selection: $gender) {
                ForEach(genders, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
            // MARK: - 키 picker
            
            // TODO: - pickerView 가져오기
            // pickerView가 들어갈 부분
            Spacer()
                .frame(height: 102)
        }
    }
}

struct TunePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TunePickerView().preferredColorScheme(.dark)
    }
}
