//
//  ViewCodeConfiguration.swift
//  InterChallenge
//
//  Created by Mayara Mendonça de Souza on 21/10/21.
//

import UIKit

protocol ViewCodeConfiguration {
    
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    
}

extension ViewCodeConfiguration {
    
    func configureViews() {}
    
    func applyViewCode() {
        
        buildViewHierarchy()
        setupConstraints()
        configureViews()
        
    }
    
}

