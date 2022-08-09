//
//  SingingListToggleView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/05.
//

import SwiftUI

struct SingingListToggleView: View {
    @Binding var toggleArray: [Bool]
    @Binding var newSingingListTitle: String

    var body: some View {
        VStack(spacing: 0){
            ForEach(0..<20){ index in
                Toggle("빠른 싱잉리스트", isOn: $toggleArray[index])
                    .toggleStyle(CheckboxToggleStyle())
                    .onChange(of: toggleArray){newValue in
                        newSingingListTitle = ""
                    }
           }
       }
    }
}


//struct SingingListToggleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingingListToggleView()
//    }
//}
