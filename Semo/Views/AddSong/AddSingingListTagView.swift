//
//  AddSingingListTagView.swift
//  Semo
//
//  Created by 조은비 on 2022/08/09.
//

import SwiftUI

struct AddSingingListTagView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .linear) private var singingList: FetchedResults<SingingList>
    @State var newSingingListTitle: String = ""
    @State var singingListToggle: [UUID: Bool] = [:]
    @State var songList: [Song] = CoreDataManager.shared.fetchSongList() ?? []
    @FocusState private var isTextFieldFocused: Bool
    @Binding var isPopToRoot: Bool
    
    var songTitle: String
    var songSinger: String
    var gender: String
    var level: String
    var tune: String
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.backgroundBlack]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
            .edgesIgnoringSafeArea(.all)
            

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
            
            // MARK: - 키보드가 올라왔을 때 보이는 singingList 추가 버튼
            VStack {
                Spacer()
                if isTextFieldFocused == true {
                    Button(action: {
                        addNewSingingList()
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
            
            // MARK: - main으로 연결되는 확인 버튼
            VStack {
                Spacer()
                Button(action: {
                    self.isPopToRoot = false
                    addNewSong()
                }, label: {
                    ConfirmButtonView(buttonName: "확인", buttonColor: isTextFieldFocused ? .black : Color.mainPurpleColor, textColor: isTextFieldFocused ? .black : .white)
                        .padding(.bottom, 60)
                })
            }
            .ignoresSafeArea(.keyboard)
            
        }
        .onAppear(perform: {
            for i in singingList {
                singingListToggle.updateValue(false, forKey: i.id!)
            }
        })
    }
    
    func addNewSingingList() {
        // 새로운 SingingList coreData에 추가
        let newSingingList: SingingList = SingingList(context: viewContext)
        newSingingList.timestamp = Date()
        newSingingList.id = UUID()
        newSingingList.title = newSingingListTitle
        newSingingList.count = 0
        // 새로 추가한 싱잉리스트는 자동 선택하게 토글 활성화
        singingListToggle.updateValue(true, forKey: newSingingList.id!)
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addNewSong() {
        // 새로운 노래 저장
        let newSong: Song = Song(context: viewContext)
        newSong.timestamp = Date()
        newSong.id = UUID()
        newSong.title = songTitle
        newSong.gender = gender
        newSong.level = level
        newSong.singer = songSinger
        newSong.tune = tune
        do {
            try viewContext.save()
            addNewSongToSingingList()
        } catch {
            print(error.localizedDescription)
        }
        
        func addNewSongToSingingList() {
            // 새로운 싱잉리스트 저장
            for i in singingList {
                if singingListToggle[i.id!] == true {
                    // 새로운 노래가 추가 되니 count 1 증가
                    i.count += 1
                    // 싱잉리스트에 해당 노래 추가
                    i.addToSingingListToSong(newSong)
                }
            }
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
}
