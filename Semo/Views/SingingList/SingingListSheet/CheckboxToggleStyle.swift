//
//  CheckboxToggleStyle.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/09.
//
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    private enum Config {
        static let iconSize: CGFloat = 22
        static let animationDuration: TimeInterval = 0.15
        static let onIconName = "checkmark.circle.fill"
        static let offIconName = "circle"
    }

    var onColor: Color = .white
    var offColor: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.white)
            Spacer()
            ZStack {
                // off
                Image(systemName: Config.offIconName)
                    .resizable()
                    .foregroundColor(offColor)
                // on
                Image(systemName: Config.onIconName)
                    .resizable()
                    .foregroundColor(onColor)
                    .opacity(configuration.isOn ? 1 : 0)
            }
            .frame(width: Config.iconSize, height: Config.iconSize)
            .animation(.easeInOut(duration: Config.animationDuration))
        }
        .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 40))
        .frame(height: 50)
        .background(configuration.isOn ? Color.grayScale3 : Color.grayScale7)
        .contentShape(Rectangle())
        .onTapGesture {
            print("tab")
            configuration.isOn.toggle()
        }
    }
}
