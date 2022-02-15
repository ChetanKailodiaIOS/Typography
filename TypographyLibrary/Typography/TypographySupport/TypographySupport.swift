//
//  TypographySupport.swift
//  TypographyLibrary
//
//  Created by chetan on 11/02/22.
//

import Foundation
import UIKit


//MARK:- Globle function for get font size and app font name

func getFontSize(_ key: String) -> CGFloat {
    let size = TypographyConstants.AppFontSize[key] ?? 16
    // size = size// * Constants.scaleFactorWidth
    return size
}

func getFontName(_ key: String) -> String {
    let font = key == fontSizeKey.italicText.rawValue ? "" : TypographyConstants.APPFONT + (TypographyConstants.AppFontName[key] ?? "-Regular")
    return font
}

func getTextColor(_ key: String) -> UIColor {
    let color = TypographyConstants.AppColor[key] ?? .black
    return color
}



//MARK:- Add all type of font size and font name that is use on the app.

class TypographyConstants {
    
    static let APPFONT: String = "Roboto"//"HelveticaNeue"
    
    static let AppFontName = ["default"              : "-Regular",
                              "pageTitle"            : "-Medium",
                              "title"                : "-Medium",
                              "subTitle"             : "-Medium",
                              "label"                : "-Medium",
                              "bodyText"             : "-Regular",
                              "smallText"            : "-Regular",
                              "italicText"           : "-Regular"
    ]
    
    static let AppFontSize = ["default"           : CGFloat(16),
                              "pageTitle"         : CGFloat(20),
                              "title"             : CGFloat(18),
                              "subTitle"          : CGFloat(16),
                              "label"             : CGFloat(14),
                              "bodyText"          : CGFloat(16),
                              "smallText"         : CGFloat(12),
                              "italicText"        : CGFloat(14)
    ]
    
    static let AppColor = ["default"             : UIColor.black,
                           "pageTitle"           : UIColor.black,
                           "title"               : UIColor.magenta,
                           "subTitle"            : UIColor.black,
                           "label"               : UIColor.black,
                           "bodyText"            : UIColor.black,
                           "smallText"           : UIColor.gray,
                           "italicText"          : UIColor.black
    ]
    
    // This is use for when use adjust font size width according device
    
    static private let adjustFactorWithConsiderationOfIpad = UIScreen.main.traitCollection.userInterfaceIdiom == .pad ? 0.65 : 1.0
    
    static let scaleFactorWidth: CGFloat = (UIScreen.main.bounds.width / 375.0) * CGFloat(adjustFactorWithConsiderationOfIpad)
    
}


enum fontSizeKey: String {
    case pageTitle = "pageTitle"
    case title = "title"
    case subTitle = "subTitle"
    case label = "label"
    case bodyText = "bodyText"
    case smallText = "smallText"
    case italicText = "italicText"
    case `default` = "default"
}
