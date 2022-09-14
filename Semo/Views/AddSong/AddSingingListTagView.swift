//
//  AddSingingListTagView.swift
//  Semo
//
//  Created by 조은비 on 2022/08/09.
//

import SwiftUI

struct AddSingingListTagView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @State var newSingingListTitle: String = ""
    @State var singingListToggle: [UUID: Bool] = [:]
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.backgroundBlack]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
            .edgesIgnoringSafeArea(.all)
            // MARK: - main으로 연결되는 확인 버튼
            VStack {
                Spacer()
                Button(action: {
                    NavigationUtil.popToRootView()
                }, label: {
                    ConfirmButtonView(buttonName: "확인", buttonColor: Color.mainPurpleColor, textColor: .white)
                        .padding(.bottom, 60)
                })
            }
            .ignoresSafeArea(.keyboard)
            // MARK: - 타이틀 및 싱잉리스트 뷰
            VStack(alignment: .center) {
                Text("이 노래가 들어갈 싱잉리스트를 \n선택해주세요.")
                    .lineSpacing(10)
                    .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(EdgeInsets(top: 14, leading: 0, bottom: 0, trailing: 0))
                TextFieldView(text: $newSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .disableAutocorrection(true)
                    .padding(.horizontal, 20)
                    .focused($isTextFieldFocused)
                HStack {
                    ContentsTitleView(titleName: "싱잉리스트")
                    Spacer()
                }
                ScrollView{
                    SingingListToggleView(toggleDictionary: $singingListToggle, newSingingListTitle: $newSingingListTitle)
                }
                .padding(.bottom, 120)
            }
            .ignoresSafeArea(.keyboard)
            // MARK: - 키보드가 올라왔을 때 보이는 추가 버튼
            VStack {
                Spacer()
                if isTextFieldFocused == true {
                    // TODO: - textField가 focus되지 않았을 때 버튼 회색으로 변경
                    Button(action: {
                        // 새로운 SingingList coreData에 추가
                        let newSingingList: SingingList = SingingList(context: viewContext)
                        newSingingList.timestamp = Date()
                        newSingingList.id = UUID()
                        newSingingList.title = newSingingListTitle
                        newSingingList.count = 0
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        newSingingListTitle = ""
                        isTextFieldFocused = false
                    }, label: {
                        FinalConfirmButtonView(buttonName: "리스트 추가하기",
                                               buttonColor: newSingingListTitle.isEmpty ? .grayScale5 : Color.mainPurpleColor,
                                               textColor: newSingingListTitle.isEmpty ? .grayScale3 : .white)
                    })
                    .disabled(newSingingListTitle == "")
                }
            }
        }
        .onAppear(perform: {
            for i in singingList {
                singingListToggle[i.id!] = false
            }
        })
    }
}

struct AddSingingListTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddSingingListTagView()
    }
}
