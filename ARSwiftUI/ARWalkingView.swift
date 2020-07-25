//
//  ARWalkingView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/22/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct ARWalkingView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        Image("arwalking")
            .resizable()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left.circle.fill").font(.system(size: 28)).foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, maxHeight : .infinity)
        
    }

}

struct ARWalkingView_Previews: PreviewProvider {
    static var previews: some View {
        ARWalkingView()
    }
}
