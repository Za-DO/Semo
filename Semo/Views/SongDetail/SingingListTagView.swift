//
//  SingingListTagView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SingingListTagView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    
    var body: some View {
        VStack {
            HStack {
                ContentsTitleView(titleName: "싱잉리스트")
                Spacer()
                EditButtonView(buttonName: "추가하기", buttonWidth: 80){}
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 34))
            }
            
            // TODO: - 싱잉리스트 데이터 받아오기
//            ForEach() {
//                HStack {
//                    Button {
//                        print("싱잉리스트 태그 삭제하기")
//                    } label: {
//                        Image(systemName: "minus.circle.fill")
//                            .foregroundColor(.grayScale4)
//                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
//                    }
//                    HStack {
//                        Text("aa")
//                            .font(.system(size: 20, weight: .semibold))
//                            .foregroundColor(.white)
//                    }
//                    Spacer()
//                }
//                .padding(.top, 20)
//            }
            ForEach(singingList){
                singingListTag(title: $0.title ?? "제목 없음")
            }
        }
    }
    
    @ViewBuilder
    func singingListTag(title: String) -> some View {
        HStack {
            Button {
                print("싱잉리스트 태그 삭제하기")
            } label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.grayScale4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            }
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}

struct SingingListTagView_Previews: PreviewProvider {
    static var previews: some View {
        SingingListTagView().preferredColorScheme(.dark)
    }
}
