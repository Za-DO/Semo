//
//  AddSongView.swift
//  Semo
//
//  Created by Kyubo Shim on 2022/07/17.
//

import SwiftUI

struct AddSongView: View {
    @State var songTitle: String = ""
    @State var songSinger: String = ""
    static let sampleBlack = Color(red: 21/255, green: 20/255, blue: 20/255)
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayscale6, Color.sampleBlack]),                         startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("노래의 기본정보를 입력하세요.")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.leading, 10)
                
                
                Text("노래 제목")
                    .font(.system(size: 15, weight: .medium))
                    .padding(.leading, 10)
                    .padding(.top, 47)
                    .foregroundColor(Color.grayscale2)
                
                TextFieldView(text: $songTitle, placeholder: "노래 제목이 무엇인가요?")
                    .frame(width: 350, height: 20, alignment: .leading)
                
                
                Text("가수 이름")
                    .font(.system(size: 15, weight: .medium))
                    .padding(.leading, 10)
                    .padding(.top, 55)
                    .foregroundColor(Color.grayscale2)
                
                TextFieldView(text: $songSinger, placeholder: "가수의 이름이 무엇인가요?")
                    .frame(width: 350, height: 20, alignment: .leading)
                
                Button(action: {
                    print(songTitle)
                    print(songSinger)
                }, label: {
                    ConfirmButtonView(buttonName: "확인")
                        .padding(.top, 88)
                })
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView()
    }
}
