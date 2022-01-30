//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/30/22.
//
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var seriesModel = SimpleSeries()
    @State var nString = "1.0"
    @State var NString = "100.0"
    
    var body: some View {
        
        VStack{
            Text("N value")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter N", text: $NString, onCommit: {Task.init {await self.sumUp(); await self.sumDown()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            
        
            
            HStack {
                VStack{
            Text("Sum Up")
                .padding(.bottom, 0)
            TextField("", text: $seriesModel.sumUpText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
                    
            Text("Sum Down")
                .padding(.bottom, 0)
            TextField("", text: $seriesModel.sumDownText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                    
                    
        }
        VStack{
            Text("Sum Up")
                .padding(.bottom, 0)
            Text("\(seriesModel.sUp, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            
            Text("Sum Down")
                .padding(.bottom, 0)
            Text("\(seriesModel.sDown, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
            
            
            
            
            
            }
            }
            
                    
                    
            
            Button("Calculate", action: {Task.init { await self.sumUp(); await self.sumDown()}})
                .padding(.bottom)
                .padding()
                .disabled(seriesModel.enableButton == false)
            
            
        }
        
    }
        
    func calculateSphere() async {
        
        seriesModel.setButtonEnable(state: false)
        
        let _ : Bool = await seriesModel.initWithSum()
        
        

}
    
    
            
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }

