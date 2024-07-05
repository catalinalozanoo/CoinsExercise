//
//  PrincipalView.swift
//  CoinsExercise
//
//  Created by catalina lozano on 04/07/24.
//

import SwiftUI

struct PrincipalView: View {
    @State private var selected: String = ""
    private let selectionOptions = ["", "option1", "option2"]
    var body: some View {
       GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Ropsten testnet")
                        .foregroundStyle(.yellow)
                    Picker("", selection: $selected) {
                        ForEach(selectionOptions, id: \.self){
                            Text($0)
                        }
                    }
                    
                    Text("OxDeAd..Beef")
                        .foregroundStyle(.white)
                    Image(systemName: "circle.circle")
                        .foregroundStyle(.pink, .purple)
                    Picker("Ropsten testnet", selection: $selected) {
                        ForEach(selectionOptions, id: \.self){
                            Text($0)
                        }
                    }
                }
                .padding()
                
                HStack(spacing: 95) {
                VStack {
                    Text("Total Balance")
                        .bold()
                        .foregroundColor(Color.gray)
                    Text("$426.75")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28))
                }.padding()
                    
                VStack{
                    Button {
                       print("add your token please")
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .bold()
                                .foregroundStyle(.white)
                            Text("Add token")
                                .bold()
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                        }.frame(width: 120, height: 35)
                        
                    }
                    .background(Color(red: 46/255, green: 64/255, blue: 83/255))
                    
                     .cornerRadius(18)
                }.padding()
            }
                Spacer()
                HStack (spacing: 60) {
                    
                  Text("Your tokens")
                  Text("Make changes")
                    
                }.bold()
                    .font(.system(size: 19))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
        }
            .frame(width: geometry.size.width,
                   height: 250, //400
                   alignment: .topLeading)
            .background(Color.black)
        }
    }
}



struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView()
    }
}
