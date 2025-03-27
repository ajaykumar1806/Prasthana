import SwiftUI
import UIKit

//class ColorString {
//
//    static let primaryColor = "#C1D72E"// app green
//    static let backgroundColor = "#001328"
//    static let listBackgroundColor = "#f2f2f6"
//    static let addEventListBackgroundColor = "#F0EEF6"
//    static let hintColor = "#C7C7CD"
//    static let textColor = "#FFFFFF" // white
//    static let textColorDark = "#000000" // black
//    static let phoneFieldBg = "#C4C4C4"
//    static let phoneFieldBgDark = "#504646"
//
//    static let fieldBackGroundColor = "#161517"// background black
//    static let roleBackgroundColorDark = "#2c2e3b"
//    static let roleBackgroundColor = "#F1F1F6"
//
//    static let textFontColor = "#24262A" // text color from zeplin for light mode
//    static let textFontColorDark = "#DDE4F0" // text color from zeplin for dark mode
//
//    static let viewBackgroundColor = "#F2F2F6"
//    static let viewBackgroundColorDark = "#1f212a"
//
//    static let statusSelectedColor = "#4f526d"
//    static let statusSelectedColorDark = "#dde4f0"
//
//    static let wonColor = "#2e5b00"
//    static let wonColorDark = "#56a10a"
//
//    static let lostColor = "#b71212"
//
//    static let tieColor = "e3ad08"
//
//    static let inActiveBtnColor = "#D9D9D9"
//    static let inActiveBtnColorDark = "#212121"
//
//    static let courtColor = "#019FC1"
//    static let insideCourtColor = "#5A91BA"
//
//    static let textFontDark = "#131418"
//    static let removeBtnColor = "#91231d"
//    static let removeBtnColorDark = "#eda280"
//    static let scoreBorderColor = "#4f526d"
//    static let scoreBorderColorDark = "#a4abb6"
//    static let searchBorderColor = "#b5becc"
//    static let searchBorderColorDark = "#424454"
//
//    static let saidYes = "#e0efce"
//    static let saidYesDark = "#303826"
//
//    static let saidNo = "#ffe8e8"
//    static let saidNoDark = "#462a2a"
//
//    static let notResponded = "#f2f2f6"
//    static let notRespondedDark = "#27272c"
//    static let textDisabledColor = "#A9A9A9"
//
//    static let messageTextFieldColor = "#1C1C1D"
//    static let dividerColor = "#C3C3C3"
//
//    static let mainHomeColor = "#1661D2"
//    static let removePairColor = "#FF4545"
//
//}
extension Color{
    
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hexString.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
    
    static let primaryColor = Color(hex: "#C1D72E")
}
