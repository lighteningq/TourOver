//
//  PlaceCellView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/20/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI

struct PlaceCellView: View {
    let place : SinglePlace
    
    var body: some View {
        SGNavigationLink(destination: VideoView(videoURL: place.videoName!, type: place.type!)){
            ZStack{
                
                Image((place.imgName ?? "ferry-building")!)
                    .resizable()
                   // .scaledToFill()
                   // .aspectRatio(contentMode: .fill)
                
                Spacer()
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.title)
                        .foregroundColor(.white)
                    HStack(alignment: .top){
                        Text(place.city ?? "San Francisco")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()

                    }

                }
                .frame(height: 59)
                .padding(.leading)
                .background(Image((place.imgName ?? "ferry-building")!).resizable())
                .offset(y: 94)
                .blur(radius: 15)

                
                
                
                
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.title)
                        .foregroundColor(.white)
                    HStack(alignment: .top){
                        Text(place.city ?? "San Francisco")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()

                    }

                }
                .frame(height: 59)
                .padding(.leading)
                .offset(y: 94)
                
            }
            .frame(height: 246)
            .cornerRadius(10)
//            .navigationTitle("")
//            .navigationBarHidden(true)
        }

    }
}

struct PlaceCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCellView(place: SinglePlace(name:"Ferry Building", city: "San Francisco", imgName: "ferry-building"))
    }
}
