//
//  YPPermissionDeniedPopup.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 12/03/2018.
//  Copyright © 2018 Yummypets. All rights reserved.
//

import UIKit

class YPPermissionDeniedPopup {
    let isFromCamera: Bool

    init(isFromCamera: Bool = false) {
        self.isFromCamera = isFromCamera
    }
    
    func popup(fromCamera: Bool = false, cancelBlock: @escaping () -> Void) -> UIAlertController {
        let popup = isFromCamera ? YPConfig.wordings.cameraPermissionPopup : YPConfig.wordings.libraryPermissionPopup
        let alert = UIAlertController(title:
            popup.title,
                                      message: popup.message,
                                      preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: popup.cancel,
                          style: UIAlertAction.Style.cancel,
                          handler: { _ in
                            cancelBlock()
            }))
        alert.addAction(
            UIAlertAction(title: popup.grantPermission,
                          style: .default,
                          handler: { _ in
                            if #available(iOS 10.0, *) {
                                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                            } else {
                                UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
                            }
            }))
        return alert
    }
}
