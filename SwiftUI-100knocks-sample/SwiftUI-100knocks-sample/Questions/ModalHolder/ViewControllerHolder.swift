//
//  ViewControllerHolder.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/01.
//

import Foundation
import UIKit
import SwiftUI

struct ViewControllerHolder {
    weak var viewController: UIViewController?

    init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
}

struct ViewControllerKey: EnvironmentKey {
        typealias Value = ViewControllerHolder

    static var defaultValue: ViewControllerHolder {
        guard var visibleViewController = UIApplication.shared.windows.first?.rootViewController else {
            return ViewControllerHolder(nil)
        }

        while let vc = visibleViewController.presentedViewController {
            visibleViewController = vc
        }

        return ViewControllerHolder(visibleViewController)
    }
}

extension EnvironmentValues {
    var viewController: ViewControllerHolder {
        get { return self[ViewControllerKey.self] }
        set { self[ViewControllerKey.self] = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(
    presentationStyle: UIModalPresentationStyle = .automatic,
    transitionStyle: UIModalTransitionStyle = .coverVertical,
    animated: Bool = true,
    backgroundColor: UIColor = .clear,
    completion: @escaping () -> () = {},
    @ViewBuilder builder: () -> Content)
    {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.rootView = AnyView(builder().environment(\.viewController,
                                                            ViewControllerHolder(toPresent)))
        toPresent.modalPresentationStyle = presentationStyle
        toPresent.modalTransitionStyle = transitionStyle

        self.present(toPresent, animated: animated, completion: completion)
    }
}
