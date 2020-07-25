//
//  EditorsChoiceView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/19/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct EditorsChoiceView: View {
    @Binding var tabSelector:Int
    @Binding var searchText : String
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                if tabSelector == 0{
                    
                    ForEach(lookAroundData.filter{$0.isNearMe==false}.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { place in
                        PlaceCellView(place: place)
                    }
                }else if tabSelector == 1{
                    ForEach(lookAroundData.filter{$0.isNearMe==true}.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { place in
                        PlaceCellView(place: place)
                    }
                }else if tabSelector == 2{
                    ForEach(lookAroundData.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { place in
                        PlaceCellView(place: place)
                    }
                }

            }
           
        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
        
    }
}

//struct EditorsChoiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditorsChoiceView(tabSelector: $tabSelector)
//    }
//}

struct EditorsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
