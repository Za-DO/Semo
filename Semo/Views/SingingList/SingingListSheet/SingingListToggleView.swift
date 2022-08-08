//
//  SingingListToggleView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/05.
//

import SwiftUI

struct SingingListToggleView: View {
    @State private var toggleArray: [Bool] = Array(repeating: false, count: 20)

    var body: some View {
        VStack(spacing: 0){
            ForEach(0..<20){ index in
                Toggle("빠른 싱잉리스트", isOn: $toggleArray[index])
                    .toggleStyle(CheckboxToggleStyle())
           }
       }
    }
}


struct SingingListToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListToggleView()
    }
}
