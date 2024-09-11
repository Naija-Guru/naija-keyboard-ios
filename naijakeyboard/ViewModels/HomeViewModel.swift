//
//  HomeViewModel.swift
//  naijakeyboard
//
//  Created by Emmanuel Idaresit on 13/08/2024.
//

import Foundation

class HomeViewModel: NSObject, ObservableObject {
    
    @Published var isKeyboardEnabled : Bool = false
    
    override init(){
        super.init()
        fetchIsKeyboardEnabled()
    }
    
    func fetchIsKeyboardEnabled(){
        if let userDefaults = UserDefaults(suiteName: "group.naijakeyboard") {
            let result : Bool = userDefaults.bool(forKey: "isKeyboardEnabled")
            isKeyboardEnabled = result
            
        }
    }
    

}


