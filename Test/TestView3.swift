//
//  TestView3.swift
//  Semo
//
//  Created by Terry Koo on 2022/08/11.
//

import SwiftUI

struct TestView3: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SingingList.timestamp, ascending: true)], animation: .default) private var singingList: FetchedResults<SingingList>
   
    
    var body: some View {
        Text("여기는 TestView3")
        
        ForEach(singingList) { i in
            Text(i.title!)
        }
        
        Button(action: {
            print("데이터 저장")
            let newSingingList: SingingList = SingingList(context: viewContext)
            newSingingList.timestamp = Date()
            newSingingList.id = UUID()
            newSingingList.title = "싱잉리스트 \(Int.random(in: 0..<99))"
            newSingingList.count = 0
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }, label: {
            Text("데이터 저장")
        })
    }
}

struct TestView3_Previews: PreviewProvider {
    static var previews: some View {
        TestView3()
    }
}
