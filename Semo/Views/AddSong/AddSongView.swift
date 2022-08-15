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
    @State var emptyFlag: Bool = false
    
    var body: some View {
        ZStack {
            Color.backgroundBlack.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.grayScale6, Color.backgroundBlack]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.3))
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
                    .foregroundColor(Color.grayScale2)
                
                TextFieldView(text: $songTitle, placeholder: "노래 제목이 무엇인가요?")
                    .frame(width: 350, height: 20, alignment: .leading)
                
                
                Text("가수 이름")
                    .font(.system(size: 15, weight: .medium))
                    .padding(.leading, 10)
                    .padding(.top, 55)
                    .foregroundColor(Color.grayScale2)
                
                TextFieldView(text: $songSinger, placeholder: "가수의 이름이 무엇인가요?")
                    .frame(width: 350, height: 20, alignment: .leading)

                NavigationLink(destination: AddMoreInfoView()) {
                    ConfirmButtonView(buttonName: "확인",
                                      buttonColor: songTitle.isEmpty || songSinger.isEmpty ? .grayScale5 : Color.mainPurpleColor,
                                      textColor: songTitle.isEmpty || songSinger.isEmpty ? .grayScale3 : .white)
                }
                .padding(.top, 88)
                .navigationTitle("")
                .disabled(self.songTitle.isEmpty || self.songSinger.isEmpty)
                
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
