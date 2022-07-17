//
//  AddSongButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/07/17.
//

import SwiftUI

struct AddSongButtonView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            Button {
            } label: {
                NavigationLink(destination: AddSongView()) {
                    Label {
                        Text("노래 추가하기")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.grayScale1)
                    } icon: {
                        Image(systemName: "plus")
                            .foregroundColor(.mainPurpleColor)
                    }
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 100, trailing: 0))
    }
}

struct AddSongButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongButtonView()
    }
}
