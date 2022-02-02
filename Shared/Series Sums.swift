//
//  Series Sums.swift
//  Simple Series
//
//  Created by Alaina Thompson on 1/30/22.
//

import SwiftUI



class SimpleSeries: NSObject,ObservableObject {
    
    var N = 100
    var sUp = 0.0
    var sDown = 0.0
    @Published var sumUpText = ""
    @Published var sumDownText = ""
    @Published var NString = "100.0"
    @Published var enableButton = true
    

    func initWithSum() async -> Bool {
       
               let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                   
           
                   taskGroup.addTask { let _ = await self.sumDown()}
                   taskGroup.addTask { let _ = await self.sumUp()}
                  
               
           }
            await setButtonEnable(state: true)
          
        
           return true
        
       }
       
    
    func sumDown() async -> Double {
        
        //  __ 1     1
        //  \        -
        //  /__ n=N  n


       
        for d in stride(from: N, through: 1, by: -1){
            
            sDown += 1.0/Double(d)
            print("sDown", sDown, d)
        }
        let newSumDownText = String(format: "%7.5f", sDown)
                      
        await updateSumDown(sumDownTextString: newSumDownText)
        await newSumDownValue(sumDownValue: sDown)
        return sDown
        
    }
    
    
    func sumUp () async -> Double {
        
        //    __ N   1
        //   \       -
        //   /__ n=1 n
 

       
        for u in stride(from: 1, through: N, by: 1) {
            sUp += 1.0/Double(u)
           print("sUp", sUp, u)
        }
        
      let newSumUpText = String(format: "%7.5f", sUp)
                    
      await updateSumUp(sumUpTextString: newSumUpText)
      await newSumUpValue(sumUpValue: sUp)
      return sUp
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @MainActor func setButtonEnable(state: Bool){
               
               
               if state {
                   
                   Task.init {
                       await MainActor.run {
                           
                           
                           self.enableButton = true
                       }
                   }
                   
                   
                       
               }
               else{
                   
                   Task.init {
                       await MainActor.run {
                           
                           
                           self.enableButton = false
                       }
                   }
                       
               }
               
           }
           
          
           @MainActor func updateSumUp(sumUpTextString: String){
               
               sumUpText = sumUpTextString
               
           }
           
           @MainActor func newSumUpValue(sumUpValue: Double){
               
               self.sUp = sumUpValue
               
           }
           
           @MainActor func newSumDownValue(sumDownValue: Double){
               
               self.sDown = sumDownValue
               
           }
           
          
           @MainActor func updateSumDown(sumDownTextString:String){
               
               sumDownText = sumDownTextString
               
               
           }
    
    
    
    
}
