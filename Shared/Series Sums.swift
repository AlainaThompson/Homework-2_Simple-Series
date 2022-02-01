//
//  Series Sums.swift
//  Simple Series
//
//  Created by Alaina Thompson on 1/30/22.
//

import SwiftUI



class SimpleSeries: NSObject,ObservableObject {
 
    var n = 1
    var N = 100
    var sUp = 0.0
    var sDown = 0.0
    @Published var sumUpText = ""
    @Published var sumDownText = ""
    @Published var NString = "100.0"
    @Published var enableButton = true
    
    
    func initWithSum() async -> Bool {
           
               
               let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                   
           
               
                   taskGroup.addTask { let _ = await self.sumUp()}
                   taskGroup.addTask { let _ = await self.sumDown()}
               
           }
            await setButtonEnable(state: true)
          

           return true
           
       }
       
    
   
    
    
    func sumUp () async -> Double {
        n = 1
        
        
        for n in stride(from: 1, to: N, by: 1) {
            sUp += Double(1/n)
        
        }
        
      let newSumUpText = String(format: "%7.5f", sUp)
                    
      await updateSumUp(sumUpTextString: newSumUpText)
      await newSumUpValue(sumUpValue: sUp)
      return sUp
        
    }
    
    
    func sumDown() async -> Double {
        n = N
        for n in stride(from: N, to: 1, by: -1){
            
            sDown += Double(1/n)
            
        }
        let newSumDownText = String(format: "%7.5f", sDown)
                      
        await updateSumDown(sumDownTextString: newSumDownText)
        await newSumDownValue(sumDownValue: sDown)
        return sDown
        
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
