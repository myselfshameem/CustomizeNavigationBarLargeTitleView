//
//  CustomButton.swift
//  CustomizeNavigationBarLargeTitleView
//
//  Created by Shameem A. Khan on 11/06/2022.
//

import UIKit

class CustomButton: UIButton {
    private var completion: (() -> ())?
    static func button(type: ButtonType = .custom,
                       title: String? = nil,
                       image: UIImage? = nil,
                       action: (() -> ())? = nil) -> CustomButton {
        let button = CustomButton(type: type)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle(title, for: .normal)
        button.addTarget(button, action: #selector(buttonPressed), for: .touchUpInside)
        button.completion = action
        return button
    }
    
    @objc func buttonPressed() {
        guard let completion = completion else { return }
        completion()
    }
}
