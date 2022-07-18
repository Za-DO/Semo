//
//  DetailContentsTitleView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/18.
//

import SwiftUI

struct ContentsTitleView: View {
    @State var titleName: String
    
    var body: some View {
        Text(titleName)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.grayScale2)
            .padding([.top, .leading], 20)
    }
}

struct ContentsTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsTitleView(titleName: "titleName")
    }
}
