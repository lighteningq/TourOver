//
//  VideoView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/23/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var videoURL : String
    var type: String
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    //@GestureState private var dragOffset = CGSize.zero
    @State var backToFlyoverList : Bool = false
    @State var isplaying = false
    @State var player = AVPlayer(playerItem: nil)
    
    var body: some View {
        

            ZStack{
                VStack{
                    VideoPlayer(player:$player, videoURL: videoURL).frame(height:UIScreen.main.bounds.height)
                    Spacer()
                }.background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                .onAppear{
                    
                }
                
                VStack{

                    
                    Button(action: {
                        if !isplaying{
                            self.player.play()
                            isplaying = true
                        }else{
                            self.player.pause()
                            isplaying = false
                        }
                        
                    }) {
                        VStack{
                            Spacer()
                            if !isplaying{
                                Text("Start Travel").fontWeight(.semibold).frame(width: 197.0, height: 38.0).background(Color.white).cornerRadius(8)
                            }else{
                                Text("Pause Travel").fontWeight(.medium).frame(width: 197.0, height: 38.0).background(Color.white).cornerRadius(8)
                            }
                            
                        }.padding(.bottom, 130)
                        
                        
                    }
                    
                }
                
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left.circle.fill").font(.system(size: 28)).foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, maxHeight : .infinity)
       

//            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
//
//                if(value.startLocation.x < 20 && value.translation.width > 100) {
//                    self.mode.wrappedValue.dismiss()
//                }
//
//            }))
            
            
            
        }
        
        
    
    
    //
    
}


struct VideoPlayer : UIViewControllerRepresentable{
    @Binding var player : AVPlayer
    var videoURL : String
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        player.replaceCurrentItem(with: AVPlayerItem(url: URL(string: videoURL)!))
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController (_ uiviewController : AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>){
        player.replaceCurrentItem(with: AVPlayerItem(url: URL(string: videoURL)!))
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoURL: "https://tour-over-bucket.s3-us-west-1.amazonaws.com/cannes.mov", type: "flyover_small_icon")
    }
}




class Host : UIHostingController<VideoView>{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
