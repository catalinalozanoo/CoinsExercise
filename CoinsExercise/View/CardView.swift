//
//  CardView.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import SwiftUI

struct CardView: View {
    var dataCoin: DataCoin?
    var fetchedData: Datas?
   
    var body: some View {
        
        HStack {
            let convertChang = Float(fetchedData!.changePercent24Hr!)
            let changePerc = String(format: "%.2f", convertChang!)
            
            let convertSupp = Float(fetchedData!.supply!)
            let supp = String(format: "%.2f", convertSupp!)
            
            let convertPrice = Float(fetchedData!.priceUsd!)
            let pric = String(format: "%.2f", convertPrice!)
            
             HStack  {
                 HStack{
                     Image("diamante")
                        .resizable()
                        .frame(width: 30, height: 30)
                     
                    VStack{
                         Text(dataCoin == nil ? changePerc : dataCoin!.changePercent24Hr)
                         Text(dataCoin == nil ? fetchedData!.name! : dataCoin!.name)
                         
                     }
                     .font(.system(size: 16))
                 } 
                 VStack {
                     Text(dataCoin == nil ? supp : dataCoin!.supply)
                             
                     HStack{
                         Text("$")
                         Text(dataCoin == nil ? pric : dataCoin!.priceUsd)
                            
                     }
                 }
                 .font(.system(size: 16)).padding()
             }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(dataCoin: DataCoin.example)
    }
}

