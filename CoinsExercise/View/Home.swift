//
//  Home.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var networkManager = NetworkManager.shared
    @State private var datas = [DataCoin]()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Datas.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Datas.name, ascending: true)]) var results : FetchedResults<Datas>
    
    var body: some View {
    ZStack{
        VStack {
            PrincipalView()
            VStack{
                if results.isEmpty {
                    if networkManager.dataCoin.isEmpty {
                        ProgressView()
                            .onAppear {
                                networkManager.fetchData(context: context)
                            }
                    } else {
                        List(networkManager.dataCoin, id: \.self){ datas in
                            HStack {
                                CardView(dataCoin: datas)
                            }
                        }
                    }
                } else {
                    List(results){ datas in
                        HStack {
                            CardView(fetchedData: datas)
                        }
                    }
                }
            }
            .frame(height: 540)
            Spacer()
           
        }
        .onAppear{
            networkManager.fetchData(context: context)
        }
        
    }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

