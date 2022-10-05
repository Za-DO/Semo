//
//  SingingListDetailCellView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct SingingListDetailCellView: View {
    @Binding var singingListViewFetch: Bool
    @Binding var listDetailEditButtonTapped: Bool
    
    var singingList: SingingList
    var song: Song
    
    // MARK: - BODY
    var body: some View {
        Button {
        } label: {
            HStack {
                if listDetailEditButtonTapped == true {
                    DeleteFromSongToSingingListView(songEditButtonTapped: $listDetailEditButtonTapped, song: song, singingList: singingList)
                        .padding(.trailing, 8)
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                }
                NavigationLink(destination: SongDetailView(song: song, genderIndex: song.gender ?? "남키", levelPickerIndex: ["하", "중", "상"].firstIndex(of: song.level ?? "중") ?? 1, tunePickerIndex: ["-6", "-5", "-4", "-3", "-2", "-1", "+0", "+1", "+2", "+3", "+4", "+5", "+6"].firstIndex(of: song.tune ?? "+0") ?? 6)) {
                    // MARK: - 노래 정보 표시
                    VStack(alignment: .leading, spacing: 10) {
                        Text(song.title ?? "제목 없음")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.grayScale1)
                        Text(song.singer ?? "가수 없음")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale2)
                    }
                    .transition(.slide)
                    .animation(.easeInOut)
                    Spacer()
                    // MARK: - Tune 정보 표시
                    Capsule()
                        .frame(width: 72, height: 32)
                        .foregroundColor(.grayScale7)
                        .overlay(content: {
                            switch song.gender {
                            case "여키" :
                                Text("\(Text("여키").foregroundColor(.womanColor)) \(song.tune ?? "+0")")
                                    .foregroundColor(.grayScale1)
                            case "혼성" :
                                Text("\(Text("혼성").foregroundColor(.duetColor)) \(song.tune ?? "+0")")
                                    .foregroundColor(.grayScale1)
                            default :
                                Text("\(Text("남키").foregroundColor(.manColor)) \(song.tune ?? "+0")")
                                    .foregroundColor(.grayScale1)
                            }
                        })
                        .disabled(listDetailEditButtonTapped)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
