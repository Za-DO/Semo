//
//  TestView1.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/11.
//

import SwiftUI

struct TestView1: View {
    var body: some View {
        Text("여기는 TestView1")
        NavigationView{
            NavigationLink(destination: TestView2(), label: {
                Text("go testView2")
            })
        }
    }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
