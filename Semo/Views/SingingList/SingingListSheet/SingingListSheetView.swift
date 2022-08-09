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
            Color.grayScale5.ignoresSafeArea()
            VStack{
                // TODO: newSingingListTitle지워지면 포커싱 풀리게
                TextFieldView(text: $newSingingListTitle, placeholder: "새로운 리스트를 바로 추가해보세요.")
                    .padding(.horizontal, 20)
                ScrollView{
                    SingingListToggleView(toggleDictionary: $singingListToggle, newSingingListTitle: $newSingingListTitle)
                }
                Button(action: {
                    if newSingingListTitle.isEmpty {
                        var checkedSingingLIst: [UUID] = []
                        for i in singingList {
                            if singingListToggle[i.id!] == true {
                                i.count += 1
                                i.addToSingingListToSong(song)
                            }
                        }
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
                        newSingingList.count = 0
                        
                        singingListToggle.updateValue(true, forKey: newSingingList.id!)
                        do {
                            try viewContext.save()
                            refresh.toggle()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    newSingingListTitle = ""
                }, label: {
                    FinalConfirmButtonView(buttonName: newSingingListTitle.isEmpty ? "확인" : "리스트 추가하기")
                })
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 37, trailing: 0))
        }
        .onAppear(perform: {
            for i in singingList {
                singingListToggle[i.id!] = false
            }
        })
    }
}

//struct SingingListSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingingListSheetView()
//    }
//}
