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


struct menuEllipse: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.50133*width, y: 1.98701*height))
        path.addCurve(to: CGPoint(x: 0.87939*width, y: 1.7009*height), control1: CGPoint(x: 0.64885*width, y: 1.98701*height), control2: CGPoint(x: 0.78251*width, y: 1.87784*height))
        path.addCurve(to: CGPoint(x: 0.99452*width, y: 1.38886*height), control1: CGPoint(x: 0.92783*width, y: 1.61245*height), control2: CGPoint(x: 0.96721*width, y: 1.50682*height))
        path.addCurve(to: CGPoint(x: 1.03733*width, y: height), control1: CGPoint(x: 1.02184*width, y: 1.27091*height), control2: CGPoint(x: 1.03733*width, y: 1.13953*height))
        path.addCurve(to: CGPoint(x: 0.99452*width, y: 0.61115*height), control1: CGPoint(x: 1.03733*width, y: 0.86047*height), control2: CGPoint(x: 1.02184*width, y: 0.72909*height))
        path.addCurve(to: CGPoint(x: 0.87939*width, y: 0.2991*height), control1: CGPoint(x: 0.96721*width, y: 0.49319*height), control2: CGPoint(x: 0.92783*width, y: 0.38755*height))
        path.addCurve(to: CGPoint(x: 0.50133*width, y: 0.01299*height), control1: CGPoint(x: 0.78251*width, y: 0.12216*height), control2: CGPoint(x: 0.64885*width, y: 0.01299*height))
        path.addCurve(to: CGPoint(x: 0.12327*width, y: 0.2991*height), control1: CGPoint(x: 0.35382*width, y: 0.01299*height), control2: CGPoint(x: 0.22016*width, y: 0.12216*height))
        path.addCurve(to: CGPoint(x: 0.00814*width, y: 0.61115*height), control1: CGPoint(x: 0.07484*width, y: 0.38755*height), control2: CGPoint(x: 0.03546*width, y: 0.49319*height))
        path.addCurve(to: CGPoint(x: -0.03467*width, y: height), control1: CGPoint(x: -0.01917*width, y: 0.72909*height), control2: CGPoint(x: -0.03467*width, y: 0.86047*height))
        path.addCurve(to: CGPoint(x: 0.00814*width, y: 1.38886*height), control1: CGPoint(x: -0.03467*width, y: 1.13953*height), control2: CGPoint(x: -0.01917*width, y: 1.27091*height))
        path.addCurve(to: CGPoint(x: 0.12327*width, y: 1.7009*height), control1: CGPoint(x: 0.03546*width, y: 1.50682*height), control2: CGPoint(x: 0.07484*width, y: 1.61245*height))
        path.addCurve(to: CGPoint(x: 0.50133*width, y: 1.98701*height), control1: CGPoint(x: 0.22016*width, y: 1.87784*height), control2: CGPoint(x: 0.35382*width, y: 1.98701*height))
        path.closeSubpath()
        return path
    }
}

struct menuEllipse2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09246*width, y: 0.26194*height))
        path.addCurve(to: CGPoint(x: 0.00611*width, y: 0.21388*height), control1: CGPoint(x: 0.05613*width, y: 0.24832*height), control2: CGPoint(x: 0.0266*width, y: 0.23205*height))
        path.addCurve(to: CGPoint(x: -0.026*width, y: 0.154*height), control1: CGPoint(x: -0.01438*width, y: 0.19572*height), control2: CGPoint(x: -0.026*width, y: 0.17549*height))
        path.addCurve(to: CGPoint(x: 0.00611*width, y: 0.09412*height), control1: CGPoint(x: -0.026*width, y: 0.13251*height), control2: CGPoint(x: -0.01438*width, y: 0.11228*height))
        path.addCurve(to: CGPoint(x: 0.09246*width, y: 0.04606*height), control1: CGPoint(x: 0.0266*width, y: 0.07595*height), control2: CGPoint(x: 0.05613*width, y: 0.05968*height))
        path.addCurve(to: CGPoint(x: 0.376*width, y: 0.002*height), control1: CGPoint(x: 0.16512*width, y: 0.01881*height), control2: CGPoint(x: 0.26537*width, y: 0.002*height))
        path.addCurve(to: CGPoint(x: 0.65954*width, y: 0.04606*height), control1: CGPoint(x: 0.48663*width, y: 0.002*height), control2: CGPoint(x: 0.58688*width, y: 0.01881*height))
        path.addCurve(to: CGPoint(x: 0.67697*width, y: 0.05302*height), control1: CGPoint(x: 0.66554*width, y: 0.04831*height), control2: CGPoint(x: 0.67136*width, y: 0.05063*height))
        path.addCurve(to: CGPoint(x: 0.67702*width, y: 0.05318*height), control1: CGPoint(x: 0.67699*width, y: 0.05308*height), control2: CGPoint(x: 0.67701*width, y: 0.05313*height))
        path.addCurve(to: CGPoint(x: 0.677*width, y: 0.05333*height), control1: CGPoint(x: 0.67701*width, y: 0.05323*height), control2: CGPoint(x: 0.67701*width, y: 0.05328*height))
        path.addCurve(to: CGPoint(x: 0.6775*width, y: 0.06491*height), control1: CGPoint(x: 0.67643*width, y: 0.05715*height), control2: CGPoint(x: 0.6765*width, y: 0.06109*height))
        path.addCurve(to: CGPoint(x: 0.67819*width, y: 0.06708*height), control1: CGPoint(x: 0.67769*width, y: 0.06562*height), control2: CGPoint(x: 0.67792*width, y: 0.06634*height))
        path.addCurve(to: CGPoint(x: 0.67879*width, y: 0.06942*height), control1: CGPoint(x: 0.67835*width, y: 0.06784*height), control2: CGPoint(x: 0.67856*width, y: 0.06862*height))
        path.addCurve(to: CGPoint(x: 0.68433*width, y: 0.0805*height), control1: CGPoint(x: 0.67987*width, y: 0.07303*height), control2: CGPoint(x: 0.68207*width, y: 0.07744*height))
        path.addCurve(to: CGPoint(x: 0.69163*width, y: 0.08729*height), control1: CGPoint(x: 0.68641*width, y: 0.0833*height), control2: CGPoint(x: 0.68863*width, y: 0.08546*height))
        path.addCurve(to: CGPoint(x: 0.70372*width, y: 0.09183*height), control1: CGPoint(x: 0.69496*width, y: 0.08933*height), control2: CGPoint(x: 0.69936*width, y: 0.09127*height))
        path.addCurve(to: CGPoint(x: 0.70415*width, y: 0.09188*height), control1: CGPoint(x: 0.70386*width, y: 0.09184*height), control2: CGPoint(x: 0.70401*width, y: 0.09186*height))
        path.addCurve(to: CGPoint(x: 0.70666*width, y: 0.09226*height), control1: CGPoint(x: 0.70496*width, y: 0.09204*height), control2: CGPoint(x: 0.70579*width, y: 0.09216*height))
        path.addCurve(to: CGPoint(x: 0.70982*width, y: 0.09245*height), control1: CGPoint(x: 0.70764*width, y: 0.09237*height), control2: CGPoint(x: 0.70871*width, y: 0.09243*height))
        path.addCurve(to: CGPoint(x: 0.72171*width, y: 0.09142*height), control1: CGPoint(x: 0.71366*width, y: 0.09285*height), control2: CGPoint(x: 0.71799*width, y: 0.0925*height))
        path.addCurve(to: CGPoint(x: 0.73228*width, y: 0.08588*height), control1: CGPoint(x: 0.72547*width, y: 0.09033*height), control2: CGPoint(x: 0.72934*width, y: 0.08819*height))
        path.addCurve(to: CGPoint(x: 0.73395*width, y: 0.08448*height), control1: CGPoint(x: 0.73286*width, y: 0.08542*height), control2: CGPoint(x: 0.73342*width, y: 0.08496*height))
        path.addCurve(to: CGPoint(x: 0.74589*width, y: 0.09412*height), control1: CGPoint(x: 0.73822*width, y: 0.08763*height), control2: CGPoint(x: 0.7422*width, y: 0.09084*height))
        path.addCurve(to: CGPoint(x: 0.778*width, y: 0.154*height), control1: CGPoint(x: 0.76638*width, y: 0.11228*height), control2: CGPoint(x: 0.778*width, y: 0.13251*height))
        path.addCurve(to: CGPoint(x: 0.74589*width, y: 0.21388*height), control1: CGPoint(x: 0.778*width, y: 0.17549*height), control2: CGPoint(x: 0.76638*width, y: 0.19572*height))
        path.addCurve(to: CGPoint(x: 0.65954*width, y: 0.26194*height), control1: CGPoint(x: 0.7254*width, y: 0.23205*height), control2: CGPoint(x: 0.69587*width, y: 0.24832*height))
        path.addCurve(to: CGPoint(x: 0.376*width, y: 0.306*height), control1: CGPoint(x: 0.58688*width, y: 0.28919*height), control2: CGPoint(x: 0.48663*width, y: 0.306*height))
        path.addCurve(to: CGPoint(x: 0.09246*width, y: 0.26194*height), control1: CGPoint(x: 0.26537*width, y: 0.306*height), control2: CGPoint(x: 0.16512*width, y: 0.28919*height))
        path.closeSubpath()
        return path
    }
}
