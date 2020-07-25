//
//  FlyOverNavView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/23/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct FlyOverNavView: View {
    @State var searchText:String = ""
    var body: some View {
        VStack(alignment: .center){
            
            
            
            SearchBar(text: $searchText)


            VStack{
                HStack{
                    Text("Top 10 Landmarks")
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack{
                    Text("Popular Flyovers")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Spacer()
                }

            }.padding(.top, 16)


            ScrollView(showsIndicators: false){
                ForEach(0..<flyoverData.count/2){ row in

                    HStack(spacing: 16){
                        ForEach(0..<2){ col in
                            let pos = row*2+col
                            SGNavigationLink(destination:VideoView(videoURL: flyoverData[pos].videoName!, type: flyoverData[pos].type!)){
                                FlyoverItem(imgName: flyoverData[pos].imgName!, city: flyoverData[pos].city!, name: flyoverData[pos].name!)
                            }
                        }
                    }

                }
            }

            Spacer()
        }.padding(.horizontal, 16)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Flyover")
        

    }
}
    


struct FlyOverNavView_Previews: PreviewProvider {
    static var previews: some View {
        FlyOverNavView()
    }
}

struct FlyoverItem: View {
    var imgName: String
    var city: String
    var name: String
    //var comment: String
    var body : some View {
        VStack{
            Image(imgName)
                .resizable()
                
                .frame(width: 163, height: 163, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
            VStack{
                HStack{
                    Text(city)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                HStack{
                    Text(name)
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                //            HStack{
                //                Text(comment)
                //                    .font(.subheadline)
                //                    .fontWeight(.regular)
                //                    .foregroundColor(Color.gray)
                //                Spacer()
                //            }
                
            }
        }
        .frame(width: 163, height: 208, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        
        
    }
}



