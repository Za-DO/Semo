//
//  AddSongButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct AddSongButtonView: View {
    @Binding var isPopToRoot: Bool
    // MARK: - BODY
    var body: some View {
        HStack {
            Button {
            } label: {
                // TODO: - destination 수정 필요
                NavigationLink(destination: AddSongView(isPopToRoot: $isPopToRoot)) {
                    Label {
                        Text("노래 추가하기")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.grayScale1)
                    } icon: {
                        Image(systemName: "plus")
                            .font(.system(size: 18))
                            .foregroundColor(.mainPurpleColor)
                    }
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 120, trailing: 0))
    }
}
