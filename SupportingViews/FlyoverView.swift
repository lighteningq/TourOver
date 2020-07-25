//
//  FlyoverView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/22/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI
import MapKit

struct FlyoverView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapview = MKMapView(frame: .zero)
        mapview.mapType = .satelliteFlyover
        return mapview
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }

}

struct FlyoverView_Previews: PreviewProvider {
    static var previews: some View {
        FlyoverView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
