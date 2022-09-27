//
//  ViewExtension.swift
//  SingSangSong
//
//  Created by Kyubo Shim on 2022/07/17.
//

import Foundation
import SwiftUI

extension View {
    
    // MARK: 텍스트 필드 관련 함수들
    
    /// 텍스트 필드 밑줄 커스텀 및 입력 여부에 따라 색이 변화합니다.
    /// - Parameter isEditing: 텍스트 필드 편집 여부 확인
    /// - Parameter isFull: 텍스트 필드 공백 여부 확인
    /// - Returns: 텍스트 필드 뷰
    func underlineTextField(isEditing : Bool, isFull: Bool, inset: CGFloat) -> some View {
        var lineColor: Color = Color.grayScale4
        if isEditing == true {
            lineColor = Color.mainPurpleColor
        }
        if isFull == true && isEditing == false {
            lineColor = Color.grayScale2
        }
        return self
//            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, inset))
            .padding(10)
            .foregroundColor(lineColor)
    }
    
    /// Placeholder의 색을 커스텀 해주는 함수입니다.
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
}
