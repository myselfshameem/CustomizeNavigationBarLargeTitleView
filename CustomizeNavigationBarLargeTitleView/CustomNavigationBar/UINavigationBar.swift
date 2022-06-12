//
//  File.swift
//  CustomizeNavigationBarLargeTitleView
//
//  Created by Shameem A. Khan on 11/06/2022.
//

import Foundation
import UIKit

private enum Constant {
    static let HeightConstraint: CGFloat = 44
    static let WidthConstraint: CGFloat = 60
    static let TrailingConstraint: CGFloat = 5
    static let BottomConstraint: CGFloat = 5
    static let LargeTitleViewTag = "_UINavigationBarLargeTitleView"
}

extension UINavigationBar {
    
    func hideCustomNavigationBarView(_ views: [UIView]) {
        UIView.animate(withDuration: 0.1) {
            views.forEach {
                $0.alpha = 0
            }
        }
    }
    
    func showCustomNavigationBarView(_ views: [UIView]) {
        UIView.animate(withDuration: 0.5) {
            views.forEach {
                $0.alpha = 1
            }
        }
    }
    
    func addButtonOnNavigationBar(_ views: [UIView]) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            guard let largeTitleItemView = self.largeTitleItemView()
            else { return }
            var lastView: UIView? = nil
            UIView.animate(withDuration: 0.1) {
                views.forEach { [weak self] view in
                    guard let strongSelf = self else { return }
                    view.translatesAutoresizingMaskIntoConstraints = false
                    largeTitleItemView.addSubview(view)
                    NSLayoutConstraint.activate([
                        view.heightAnchor.constraint(equalToConstant: Constant.HeightConstraint),
                        view.widthAnchor.constraint(equalToConstant: Constant.WidthConstraint),
                        view.bottomAnchor.constraint(equalTo: largeTitleItemView.bottomAnchor, constant: -Constant.BottomConstraint),
                        view.trailingAnchor.constraint(equalTo: lastView?.leadingAnchor ?? strongSelf.trailingAnchor, constant: -Constant.TrailingConstraint)
                    ])
                    lastView = view
                }
            }
        }
    }
    
    private func largeTitleItemView() -> UIView? {
        guard
            let targetClass: AnyClass = NSClassFromString(Constant.LargeTitleViewTag)
        else { return nil }
        let navigationBarLargeTitleView = subviews.first { $0.isKind(of: targetClass)}
        guard let titleView = navigationBarLargeTitleView else { return nil }
        return titleView
    }

}
