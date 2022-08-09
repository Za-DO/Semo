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
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.backgroundBlack]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
            .edgesIgnoringSafeArea(.all)
            // MARK: - main으로 연결되는 확인 버튼
            VStack {
                Spacer()
                NavigationLink(destination: TestDetailView()) {
                    ConfirmButtonView(buttonName: "확인")
                        .padding(.bottom, 60)
                }
                .navigationTitle("")
            }
            .ignoresSafeArea(.keyboard)
            // MARK: - 타이틀 및 싱잉리스트 뷰
            VStack(alignment: .center) {
                Text("이 노래가 들어갈 싱잉리스트를 \n선택해주세요.")
                    .lineSpacing(10)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(EdgeInsets(top: 14, leading: 20, bottom: 0, trailing: 0))
                TextFieldView(text: $newSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .disableAutocorrection(true)
                    .padding(.horizontal, 20)
                    .focused($textFieldIsFocused)
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
                if textFieldIsFocused == true {
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
                        textFieldIsFocused = false
                    }, label: {
                        FinalConfirmButtonView(buttonName: "리스트 추가하기")
                    })
                }
            }
        }
    }
}

struct AddSingingListTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddSingingListTagView()
    }
}
