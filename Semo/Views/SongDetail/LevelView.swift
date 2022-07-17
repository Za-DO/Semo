//
//  LevelView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct LevelView: View {
    var body: some View {
        VStack {
            HStack {
                Text("숙련도")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.grayScale2)
                    .padding([.top, .leading], 20)
                Spacer()
            }
            // TODO: - pickerView 가져오기
            Spacer()
                .frame(height: 102)
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView().preferredColorScheme(.dark)
    }
}
