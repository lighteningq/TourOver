//
//  LookAroundView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/21/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct LookAroundView: View {
    @State private var tabSelector = 0
    @State var searchText = ""
    private let tabArray = ["Editor's Choice", "Near me","All"]
    private let tabViews = [["a", "b", "c"], ["a", "b", "c"], ["a", "b", "c"]]
    
    var body: some View {
       
            
            VStack(alignment: .center){
                // Search
                SearchBar(text: $searchText)
                Picker(selection: $tabSelector, label: Text("Select a Sport")) {
                        ForEach(0 ..< tabArray.count) {
                                           Text(self.tabArray[$0])

                                       }
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                           
               EditorsChoiceView(tabSelector: $tabSelector, searchText:$searchText)
                         
                          //PlacesView(content: places, name: tabArray[tabSelector])
                            
                        
                               
                                  Spacer()
                                 
            }.padding(.horizontal, 16)
            .edgesIgnoringSafeArea(.bottom)

            .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("Looks Around")
            


        
    }
}
//struct PlacesView: View {
//    let content :[SinglePlace]
//    let name: String
//
//    var body: some View {
//        if name=="Editor's Pick"{
//            return AnyView(EditorsChoiceView(isNearMe: false))
//        }
//        else if name=="Near me"{
//            return  AnyView(EditorsChoiceView(isNearMe: false))
//        }
//        else if name=="All" {
//            return   AnyView(AllView())
//        } else{
//            return  AnyView(EditorsChoiceView(places: content))
//        }
//
//    }
//}

struct LookAroundView_Previews: PreviewProvider {
    static var previews: some View {
       
            LookAroundView()
          
        
    }
}
