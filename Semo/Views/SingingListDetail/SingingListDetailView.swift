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
    @State var isSingingListTitleEditing: Bool = false
    @Binding var listEditButtonTap: Bool
    @Binding var songEditButtonTap: Bool
    
    var singingList: SingingList
    
    @State var singingListTitle: String {
        willSet {
            singingListTitle = singingList.title ?? "제목없음"
        }
    }

    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height * 0.16)
                    .foregroundColor(songEditButtonTap == true ? .grayScale7 : .grayScale6)
                    .opacity(songEditButtonTap == true ? 1 : 0.4)
                Spacer()
            }
            VStack {
                HStack {
                    TextField("", text: $singingListTitle, onEditingChanged: { changed in
                        self.isSingingListTitleEditing = changed
                    })
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .placeholder(when: singingListTitle.isEmpty) {
                        Text("빠른 싱잉리스트")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.grayScale2)
                    }
                    .disabled(!songEditButtonTap)
                }
                .underlineTextField(isEditing: isSingingListTitleEditing, isFull: !singingListTitle.isEmpty, inset: 55, active: songEditButtonTap)
                .padding(.horizontal, 10)
                Spacer()
            }
            .padding(.top, 65)
            SingingListDetailCellView(songEditButtonTap: $songEditButtonTap, singingList: singingList)
                .padding(.top, 35)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SongEditButtonView(buttonName: songEditButtonTap == true ? "완료" : "편집", buttonWidth: 50) {
                    self.songEditButtonTap.toggle()
                }
                .padding(.trailing, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if songEditButtonTap == false {
                    CustomBackButton(buttonName: "") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .navigationBarBackButtonHidden(true)
                } else {
                    Button {
                        print("리스트 편집 그만하기")
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100) {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
        .onDisappear {
            self.songEditButtonTap = false
        }
    }
}
