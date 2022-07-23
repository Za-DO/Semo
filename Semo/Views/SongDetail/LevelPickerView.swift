//
//  LevelView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct LevelPickerView: View {
    var levels = ["하", "중", "상"]
    @State var level = "중"
    
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "숙련도")
                Spacer()
            }
            
            // TODO: - pickerView 가져오기
            // pickerView가 들어갈 부분
            Spacer()
                .frame(height: 102)
        }
    }
}

struct LevelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LevelPickerView().preferredColorScheme(.dark)
    }
}
