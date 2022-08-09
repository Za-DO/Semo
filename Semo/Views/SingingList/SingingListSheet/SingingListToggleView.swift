//
//  SingingListToggleView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/05.
//

import SwiftUI

struct SingingListToggleView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @Binding var toggleDictionary: [UUID: Bool]
    @Binding var newSingingListTitle: String
    @State var isOn: Bool = false

    var body: some View {
        VStack(spacing: 0){
            ForEach(singingList){
                Toggle($0.title ?? "제목 없음", isOn: Binding($toggleDictionary[$0.id!]) ?? $isOn)
                    .toggleStyle(CheckboxToggleStyle())
                    .onChange(of: toggleDictionary){newValue in
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
