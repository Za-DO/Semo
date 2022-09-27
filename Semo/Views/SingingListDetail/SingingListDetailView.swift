//
//  SingingListDetailView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @State var singingListTitle: String = ""
    @State var isSingingListTitleEditing: Bool = false
    @Binding var listEditButtonTap: Bool
    @Binding var songEditButtonTap: Bool

    var singingList: SingingList
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height * 0.16)
                    .foregroundColor(listEditButtonTap == true ? .grayScale7 : .grayScale6)
                    .opacity(listEditButtonTap == true ? 1 : 0.4)
                Spacer()
            }
            
            VStack {
                HStack {
                    TextField("", text: $singingListTitle, onEditingChanged: { changed in
                        self.isSingingListTitleEditing = changed
                    })
                    .placeholder(when: singingListTitle.isEmpty) {
                        Text("\(singingList.title ?? "제목없음")")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .underlineTextField(isEditing: isSingingListTitleEditing, isFull: !singingListTitle.isEmpty, inset: 60)
                .padding(.horizontal, 10)
                Spacer()
            }
            .padding(.top, 60)
            SingingListDetailCellView(songEditButtonTap: $songEditButtonTap, singingList: singingList)
                .padding(.top, 40)
        }
//        .navigationBarTitle(singingList.title ?? "제목 없음")
//        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SongEditButtonView(buttonName: listEditButtonTap == true ? "완료" : "편집", buttonWidth: 50) {
                    self.listEditButtonTap.toggle()
                }
                .padding(.trailing, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(buttonName: "") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100) {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}
