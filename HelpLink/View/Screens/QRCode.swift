//
//  QRCode.swift
//  HelpLink
//
//  Created by Suvass Ravala on 2/18/23.
//
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCode: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url: String
    var body: some View {
        VStack{
            Image(uiImage: generateQRCodeImage(url:url))
                .interpolation(.none)
                .resizable()
                .frame(width: 150, height: 150, alignment:.center)
            Link(destination: URL(string: "www.google.com")!, label:{
                Text("See Website")
                    .bold()
                    .frame(width:250, height:50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(12)
            })
        }
        
    }
    
    func generateQRCodeImage(url : String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCode_Previews: PreviewProvider {
    static var previews: some View {
        QRCode(url: "www.google.com")
    }
}
