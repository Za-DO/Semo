//
//  SingingListSheetView.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//

import SwiftUI
// TODO: 커스텀 sheet로 바꿔줘야 함
struct SingingListSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
    @State var newSingingListTitle: String = ""
    @State var singingListToggle: [UUID: Bool] = [:]
    @Binding var refresh: Bool
    @Binding var isPresent: Bool
    var song: Song
    
    var body: some View {
        ZStack {
            Color.grayScale7.ignoresSafeArea()
            VStack{
                // TODO: newSingingListTitle지워지면 포커싱 풀리게
                TextFieldView(text: $newSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .padding(.horizontal, 20)
                ScrollView{
                    SingingListToggleView(toggleDictionary: $singingListToggle, newSingingListTitle: $newSingingListTitle)
                }
                Button(action: {
                    // TextFieldView가 비어있을때
                    if newSingingListTitle.isEmpty {
                        var checkedSingingList: [UUID] = []
                        for i in singingList {
                            if singingListToggle[i.id!] == true {
                                // 싱잉리스트에 해당 노래 추가
                                i.addToSingingListToSong(song)
                            }
                        }
                        // 싱잉리스트에 변경 사항 저장
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        // sheet 닫기
                        isPresent.toggle()
                    } else {
                        // 새로운 SingingList coreData에 추가
                        let newSingingList: SingingList = SingingList(context: viewContext)
                        newSingingList.timestamp = Date()
                        newSingingList.id = UUID()
                        newSingingList.title = newSingingListTitle
                        // 새로 추가한 싱잉리스트는 자동 선택하게 토글 활성화
                        singingListToggle.updateValue(true, forKey: newSingingList.id!)
                        do {
                            try viewContext.save()
                            refresh.toggle()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    // 새로운 싱잉리스트 코어데이터에 추가 후 TextFieldView 초기화
                    newSingingListTitle = ""
                }, label: {
                    FinalConfirmButtonView(buttonName: newSingingListTitle.isEmpty ? "확인" : "리스트 추가하기",
                                           buttonColor: checkToggle(data: singingListToggle) && newSingingListTitle.isEmpty ? Color.grayScale5 : Color.mainPurpleColor,
                                           textColor: checkToggle(data: singingListToggle) && newSingingListTitle.isEmpty ? Color.grayScale3 : .white)
                })
                .disabled(checkToggle(data: singingListToggle) && newSingingListTitle.isEmpty)
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 1, trailing: 0))
        }
        // view가 보일때 singingListToggle 배열 false로 초기화
        .onAppear(perform: {
            for i in singingList {
                singingListToggle[i.id!] = false
            }
        })
    }
    
    func checkToggle(data: [UUID: Bool]) -> Bool {
        for i in data {
            if i.value == true {
                return false
            }
        }
        return true
    }
}

//struct SingingListSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingingListSheetView()
//    }
//}
