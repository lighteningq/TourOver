//
//  ContentView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/17/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var places: [SinglePlace] = []
    
    
   
       
    
    var body: some View {
        NavigationView{
            List{
                
                Section(header: SectionHeader(text: "Quick Actions")){
                    
                    
                        HStack{
                            // looks around
                            
                            SGNavigationLink(destination: LookAroundView())  {
                                LookAroundNavView()
                            }
                            
                            // flyover and arview
                            VStack{
                                SGNavigationLink(destination: FlyOverNavView())  {
                                    HomePageSmallIConView(name: "Flyovers", iconName: "flyover_small_icon_orange", number: "10",  color: Color.gray)
                                        .padding(12)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                }
                                
                                
                                SGNavigationLink(destination: ARWalkingView())  {
                                    HomePageSmallIConView(name: "AR Walking", iconName: "ar_small_icon", number:"1", color: Color.white)
                                        .padding(12)
                                        .background(Color.purple)
                                        .cornerRadius(10)
                                }
                            }
                            
                            
                        }.listRowBackground(Color(red: 242/255, green: 242/255, blue: 247/255))
                        
                           .listRowInsets(EdgeInsets())
    
                        
                }
                    
                    
                    
                    
                    Section(header: SectionHeader(text: "Saved Places")){
                        
                        
                        SavedPlacesView(data: savedData)
                        
                    }
                }
                
                
                .listRowInsets(EdgeInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16)))
                .listStyle(InsetGroupedListStyle())
                .background(Color.clear)
                .navigationBarTitle("Travel Over")
            
                
                
            }
            
            
            
            
            
            
            
            
        }
        
        
        
    
}



struct SGNavigationLink<Content, Destination>: View where Destination: View, Content: View {
    let destination:Destination?
    let content: () -> Content
    
    
    @State private var isLinkActive:Bool = false
    
    init(destination: Destination, title: String = "", @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.destination = destination
    }
    
    var body: some View {
        return ZStack (alignment: .leading){
            if self.isLinkActive{
                NavigationLink(destination: destination, isActive: $isLinkActive){Color.clear}.frame(height:0)
            }
            content()
        }
        .onTapGesture {
            self.pushHiddenNavLink()
        }
    }
    
    func pushHiddenNavLink(){
        self.isLinkActive = true
    }
}









struct SearchBar: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        
        HStack {
            
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        Spacer()
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                
                            }
                        }
                    }
                )
                //  .padding(.horizontal, 16)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}








struct SectionHeader : View {
    var text : String
    var body: some View {
        Text(text)
            .font(.headline)
            
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .padding(.top, 20)
        
    }
}

struct SavedPlacesView: View {
    var data: [SinglePlace]
    var body: some View {
        
        
        ForEach(data){ place in
            NavigationLink(destination: VideoView(videoURL: place.videoName!, type: place.type!)){
                HStack{
                    Image(place.type!)
                    Text(place.name)
                    Spacer()
                }
            }
            .frame( height: 59, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        
        
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(places: testData)
    }
}
#endif

struct HomePageSmallIConView: View {
    var name:String
    var iconName : String
    var number = "1"
    var color = Color.gray
    var body: some View {
        VStack{
            HStack{
                Image(iconName)
                Spacer()
                if number != "1" {
                    Text(number)
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                
            }
            HStack{
                Text(name)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            
            
        }
    }
}

struct LookAroundNavView: View {
    var body: some View {
        HStack{
            VStack(){
                HomePageSmallIConView(name: "Looks around", iconName: "lookaround_small_icon_blue", number: "20", color: Color.gray)
                HStack(alignment: .center){
                    VStack(alignment: .center, spacing: 3){
                        HStack(spacing: 10){
                            Image("thumb1")
                            Image("thumb2")
                            Image("thumb3")
                        }
                        
                        HStack(spacing : 10){
                            Image("thumb4")
                            
                            
                            Image("thumb5")
                            Image("thumb6")
                        }
                        
                    }
                    Spacer()
                }
                
                
            }
            .padding(.all, 12)
            .frame(width: 164, height: 181, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}

struct ExtractedView: View {
    var body: some View {
        Text("Destination")
    }
}
