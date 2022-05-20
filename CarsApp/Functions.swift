//
//  Functions.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 08.05.2022.
//

import Foundation
import SwiftUI

// Get screen size
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


// RoundedCorners function
struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()
        
        return path
    }
}


// Get size of UserDefaults
func getSizeOfUserDefaults() -> Int? {
    guard let libraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
        return nil
    }

    guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
        return nil
    }

    let filepath = "\(libraryDir)/Preferences/\(bundleIdentifier).plist"
    let filesize = try? FileManager.default.attributesOfItem(atPath: filepath)
    let retVal = filesize?[FileAttributeKey.size]
    return retVal as? Int
}


// function for Haptic Touch
func hapticTouch(power: String) {
    
    if power == "medium" {
        let haptic = UIImpactFeedbackGenerator(style: .medium)
        haptic.impactOccurred()
    }
    else if power == "soft" {
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
    }
    else if power == "light" {
        let haptic = UIImpactFeedbackGenerator(style: .light)
        haptic.impactOccurred()
    }
    else if power == "heavy" {
        let haptic = UIImpactFeedbackGenerator(style: .heavy)
        haptic.impactOccurred()
    }
    else if power == "rigid" {
        let haptic = UIImpactFeedbackGenerator(style: .rigid)
        haptic.impactOccurred()
    }
    
}


// grid struct
struct gridView:View {
    var horizontalSpacing: CGFloat = 20
    var verticalSpacing: CGFloat = 20

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let numberOfHorizontalGridLines = Int(geometry.size.height / self.verticalSpacing)
                let numberOfVerticalGridLines = Int(geometry.size.width / self.horizontalSpacing)
                for index in 0...numberOfVerticalGridLines {
                    let vOffset: CGFloat = CGFloat(index) * self.horizontalSpacing
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
                }
                for index in 0...numberOfHorizontalGridLines {
                    let hOffset: CGFloat = CGFloat(index) * self.verticalSpacing
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
                }
            }
            .stroke()
        }
    }
}


// star shape
struct star: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.45628*width, y: 0.04085*height))
        path.addCurve(to: CGPoint(x: 0.5378*width, y: 0.04085*height), control1: CGPoint(x: 0.47295*width, y: 0.00369*height), control2: CGPoint(x: 0.52113*width, y: 0.00369*height))
        path.addLine(to: CGPoint(x: 0.64764*width, y: 0.28566*height))
        path.addCurve(to: CGPoint(x: 0.68186*width, y: 0.31302*height), control1: CGPoint(x: 0.65426*width, y: 0.30042*height), control2: CGPoint(x: 0.66706*width, y: 0.31065*height))
        path.addLine(to: CGPoint(x: 0.92747*width, y: 0.35227*height))
        path.addCurve(to: CGPoint(x: 0.95266*width, y: 0.43756*height), control1: CGPoint(x: 0.96475*width, y: 0.35823*height), control2: CGPoint(x: 0.97964*width, y: 0.40863*height))
        path.addLine(to: CGPoint(x: 0.77494*width, y: 0.62812*height))
        path.addCurve(to: CGPoint(x: 0.76187*width, y: 0.67238*height), control1: CGPoint(x: 0.76423*width, y: 0.63961*height), control2: CGPoint(x: 0.75934*width, y: 0.65616*height))
        path.addLine(to: CGPoint(x: 0.80382*width, y: 0.94146*height))
        path.addCurve(to: CGPoint(x: 0.73787*width, y: 0.99416*height), control1: CGPoint(x: 0.81019*width, y: 0.9823*height), control2: CGPoint(x: 0.77122*width, y: 1.01345*height))
        path.addLine(to: CGPoint(x: 0.51819*width, y: 0.86713*height))
        path.addCurve(to: CGPoint(x: 0.47589*width, y: 0.86713*height), control1: CGPoint(x: 0.50495*width, y: 0.85946*height), control2: CGPoint(x: 0.48913*width, y: 0.85946*height))
        path.addLine(to: CGPoint(x: 0.25621*width, y: 0.99416*height))
        path.addCurve(to: CGPoint(x: 0.19025*width, y: 0.94146*height), control1: CGPoint(x: 0.22286*width, y: 1.01345*height), control2: CGPoint(x: 0.18389*width, y: 0.9823*height))
        path.addLine(to: CGPoint(x: 0.23221*width, y: 0.67238*height))
        path.addCurve(to: CGPoint(x: 0.21914*width, y: 0.62812*height), control1: CGPoint(x: 0.23474*width, y: 0.65616*height), control2: CGPoint(x: 0.22985*width, y: 0.63961*height))
        path.addLine(to: CGPoint(x: 0.04141*width, y: 0.43756*height))
        path.addCurve(to: CGPoint(x: 0.0666*width, y: 0.35227*height), control1: CGPoint(x: 0.01444*width, y: 0.40863*height), control2: CGPoint(x: 0.02932*width, y: 0.35823*height))
        path.addLine(to: CGPoint(x: 0.31221*width, y: 0.31302*height))
        path.addCurve(to: CGPoint(x: 0.34644*width, y: 0.28566*height), control1: CGPoint(x: 0.32702*width, y: 0.31065*height), control2: CGPoint(x: 0.33982*width, y: 0.30042*height))
        path.addLine(to: CGPoint(x: 0.45628*width, y: 0.04085*height))
        path.closeSubpath()
        return path
    }
}


// heart shape
struct heart: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.63985*width, y: 0.00314*height))
        path.addCurve(to: CGPoint(x: 0.4935*width, y: 0.08209*height), control1: CGPoint(x: 0.57305*width, y: 0.02219*height), control2: CGPoint(x: 0.54131*width, y: 0.03975*height))
        path.addCurve(to: CGPoint(x: 0.32277*width, y: 0.00314*height), control1: CGPoint(x: 0.43978*width, y: 0.03401*height), control2: CGPoint(x: 0.40321*width, y: 0.01532*height))
        path.addCurve(to: CGPoint(x: 0.20082*width, y: 0.0163*height), control1: CGPoint(x: 0.27402*width, y: -0.00228*height), control2: CGPoint(x: 0.24738*width, y: 0.00143*height))
        path.addCurve(to: CGPoint(x: 0.0081*width, y: 0.25099*height), control1: CGPoint(x: 0.11086*width, y: 0.05023*height), control2: CGPoint(x: 0.02089*width, y: 0.14488*height))
        path.addCurve(to: CGPoint(x: 0.13985*width, y: 0.60841*height), control1: CGPoint(x: -0.02292*width, y: 0.41233*height), control2: CGPoint(x: 0.03817*width, y: 0.5069*height))
        path.addLine(to: CGPoint(x: 0.46911*width, y: 0.96367*height))
        path.addLine(to: CGPoint(x: 0.4935*width, y: 0.98998*height))
        path.addLine(to: CGPoint(x: 0.5179*width, y: 0.96367*height))
        path.addLine(to: CGPoint(x: 0.84716*width, y: 0.60841*height))
        path.addCurve(to: CGPoint(x: 0.90814*width, y: 0.10841*height), control1: CGPoint(x: 0.97133*width, y: 0.49043*height), control2: CGPoint(x: 1.06139*width, y: 0.29117*height))
        path.addCurve(to: CGPoint(x: 0.78619*width, y: 0.0163*height), control1: CGPoint(x: 0.87121*width, y: 0.06206*height), control2: CGPoint(x: 0.84386*width, y: 0.04109*height))
        path.addCurve(to: CGPoint(x: 0.63985*width, y: 0.00314*height), control1: CGPoint(x: 0.72757*width, y: -0.00066*height), control2: CGPoint(x: 0.69606*width, y: -0.00312*height))
        path.closeSubpath()
        return path
    }
}
