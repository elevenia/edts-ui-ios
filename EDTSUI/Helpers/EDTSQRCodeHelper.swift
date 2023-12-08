//
//  EDTSQRCodeHelper.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//

import UIKit

public struct QRCodeHelper {
    
    public static func generateQRCode(text string: String, type: QRCodeType = .qrcode) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: type.rawValue) {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                let image = UIImage(ciImage: output)
                return image
            }
        }

        return nil
    }

    public enum QRCodeType: String {
        case qrcode = "CIQRCodeGenerator"
        case barcode = "CICode128BarcodeGenerator"
    }
}
