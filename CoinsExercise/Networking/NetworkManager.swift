//
//  NetworkManager.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import Foundation
import SwiftUI
import UIKit
import CoreData

final class NetworkManager: ObservableObject {
    
    init () {}
    static  let shared = NetworkManager()
    @Published var dataCoin = [DataCoin]()
    
    //saving JSON to Core Data
    func saveData(context: NSManagedObjectContext) {
        dataCoin.forEach { (data) in
            let entity = Datas(context: context)
            
            entity.name = data.name
            entity.supply = data.supply
            entity.changePercent24Hr = data.changePercent24Hr
            entity.priceUsd = data.priceUsd
            
            
            //saving all data pending
            do {
                try context.save()
                print("success")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchData(context: NSManagedObjectContext){
        let url = URL(string: "https://api.coincap.io/v2/assets")!
        let fetchRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: fetchRequest) {[weak self] (data, response, error) -> Void in
            if error != nil {
                print("Error in session is not nil")
            } else {
                
                let httResponse = response as? HTTPURLResponse
                print("status code: \(String(describing: httResponse?.statusCode))")
                
                guard let safeData = data else {return}
                
                do {
                    if let decodedQuery = try? JSONDecoder().decode(Coins.self, from: safeData) {
                        
                        DispatchQueue.main.async {
                            self?.dataCoin = decodedQuery.data
                            self?.saveData(context: context)
                            print(decodedQuery)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
}
