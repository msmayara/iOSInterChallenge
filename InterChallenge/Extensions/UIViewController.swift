//
//  UIViewController.swift
//  InterChallenge
//
//  Created by Mayara Mendonça de Souza on 24/10/21.
//

import UIKit

extension UIViewController {
    
    func displayErrorAlert() {
        
        let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
        
    }
}
