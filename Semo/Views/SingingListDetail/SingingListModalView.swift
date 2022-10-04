//
//  SingingListModalView.swift
//  Semo
//
//  Created by 유정인 on 2022/08/09.
//

import SwiftUI

struct SingingListModalView: View {
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @State var singingListTitle: String = ""
    @State var singingListToggle: [UUID: Bool] = [:]
    @FocusState private var isTextFieldFocused: Bool
    
    @Binding var listEditButtonTapped: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            VStack(alignment: .leading) {
                Group {
                    Text("싱잉리스트 만들기")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 28)
                    Text("리스트 이름")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.grayScale2)
                }
                .padding(.horizontal, 24)
                
                TextFieldView(text: $singingListTitle, placeholder: "새로운 리스트를 추가하세요.")
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 55, trailing: 15))
                    .focused($isTextFieldFocused)
                
                Spacer()
            }
            .padding(.top, 36)
            .ignoresSafeArea(.keyboard)
            
            // MARK: - 키보드가 올라왔을 때 보이는 추가 버튼
            VStack {
                Spacer()
                if isTextFieldFocused == true {
                    Button(action: {
                        // 새로운 SingingList coreData에 추가
                        CoreDataManager.shared.saveNewSingingList(singingListTitle: singingListTitle)
                        singingListTitle = ""
                        isTextFieldFocused = false
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        FinalConfirmButtonView(buttonName: "리스트 추가하기",
                                               buttonColor: singingListTitle.isEmpty ? .grayScale5 : Color.mainPurpleColor, textColor: singingListTitle.isEmpty ? .grayScale3 : .white)
                    })
                    .disabled(singingListTitle == "")
                }
            }
        }
        .onAppear {
            self.listEditButtonTapped = false
        }
    }
}
