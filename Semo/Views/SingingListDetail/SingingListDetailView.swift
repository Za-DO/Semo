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
    @Binding var editButtonTap: Bool
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
                    .frame(height: UIScreen.main.bounds.height * 0.12)
                    .foregroundColor(listEditButtonTap == true ? .grayScale7 : .grayScale6)
                    .opacity(listEditButtonTap == true ? 1 : 0.4)
                Spacer()
            }
            SingingListDetailCellView(songEditButtonTap: $songEditButtonTap, singingList: singingList)
        }
        // TODO: - navigationtitle 폰트 크기, 굵기 수정(커스텀으로만 가능)
        .navigationBarTitle(singingList.title ?? "제목 없음")
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
