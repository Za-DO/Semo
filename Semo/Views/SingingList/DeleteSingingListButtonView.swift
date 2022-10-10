//
//  DeleteSingingListButtonView.swift
//  Semo
//
//  Created by 유정인 on 2022/09/20.
//

import SwiftUI

struct DeleteSingingListButtonView: View {
    @State var showDeleteAlert: Bool = false
    @Binding var listEditButtonTapped: Bool
    
    var singingList: SingingList
    
    var body: some View {
        Button {
            self.showDeleteAlert = true
            print("노래 삭제")
        } label: {
            Image(systemName: "minus.circle.fill")
                .foregroundColor(.grayScale3)
        }
        .alert("이 리스트를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                // TODO: - 리스트 삭제 코드
                CoreDataManager.shared.deleteSingingList(singingList: singingList)
                self.listEditButtonTapped = false
            }
        }
    }
}
