//
//  SongDetailView.swift
//  Semo
//
//  Created by 조은비 on 2022/07/17.
//

import SwiftUI

struct SongDetailView: View {
    @State var gender = 1
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("backgroundImage")
                .ignoresSafeArea()
            Rectangle()
                .foregroundColor(.grayScale6)
                .opacity(0.4)
                .frame(height: 220)
                .ignoresSafeArea()
            VStack {
                // MARK: - 곡 기본 정보
                Spacer()
                    .frame(height: 70)
                Text("노래 제목입니다")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                Text("노래 가수입니다")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.grayScale2)
                    .padding(.top, 2)
                    .padding(.bottom, 20)
                // MARK: - 곡 숙련도
                ScrollView {
                    HStack {
                        Text("숙련도")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                            .padding([.top, .leading], 20)
                        Spacer()
                    }
                    // pickerView 들어갈 부분
                    Spacer()
                        .frame(height: 102)
                    // MARK: - 키 설정
                    HStack {
                        Text("키")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                            .padding([.top, .leading], 20)
                        Spacer()
                    }
                    Picker("pick gender", selection: $gender, content: {
                        Text("여성").tag(0)
                        Text("혼성").tag(1)
                        Text("남성").tag(2)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing], 24)
                    .padding(.top, 24)
                    // pickerView 들어갈 부분
                    Spacer()
                        .frame(height: 102)
                    // MARK: - 싱잉리스트 태그
                    HStack {
                        Text("싱잉리스트")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                            .padding([.top, .leading], 20)
                        Spacer()
                        EditButtonView(buttonName: "추가하기", buttonWidth: 80)
                            .padding(.top, 16)
                            .padding(.trailing, 34)
                    }
                    // TODO: - 싱잉리스트 데이터 받아오기
                    ForEach(0..<10) { _ in
                        HStack {
                            Button {
                                print("싱잉리스트 태그 삭제하기")
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.grayScale4)
                                    .padding(.trailing, 10)
                                    .padding(.leading, 20)
                            }
                            HStack {
                                Text("싱잉리스트")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            print("기록 삭제하기")
                        } label: {
                            EditButtonView(buttonName: "삭제", buttonWidth: 60)
                                .padding(.trailing, 15)
                        }
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView().preferredColorScheme(.dark)
    }
}
