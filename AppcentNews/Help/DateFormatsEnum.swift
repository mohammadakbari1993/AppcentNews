//
//  DateFormatsEnum.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation

enum DateFormatsEnum : String {
    case ISO = "yyyy-MM-dd'T'HH:mm:ssZ"
    case ISO_STANDARD = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case SHORT_WITH_DOTS = "dd.MM.yy"
    case SHORT_WITH_SLASH = "MM/dd/yyyy"
    case DAY_MONTH_YEAR_HOUR_MINIUTE = "MM-dd-yyyy HH:mm"
    case MONTHNAME_DAY_HOUR_MINIUTE_AMPM = "MMM d, h:mm a"
    case MONTHNAME_DAY = "MMM d"
    case DAYOFWEEK_MONTHNAME_DAY_YEAR = "EEEE, MMM d, yyyy"
    case FOUR_DIGIT_YEAR = "yyyy"
    case TWO_DIGIT_YEAR = "yy"
    case TWO_DIGIT_MONTH = "MM"
    case ONE_OR_TWO_DIGIT_MONTH = "M"
    case TWO_DIGIT_DAY = "dd"
    case ONE_OR_TWO_DIGIT_DAY = "d"
    case TWO_DIGIT_HOUR_24FRMAT = "HH"
    case ONE_OR_TWO_DIGIT_HOUR_24FRMAT = "H"
    case TWO_DIGIT_HOUR_12FRMAT = "hh"
    case ONE_OR_TWO_DIGIT_HOUR_12FRMAT = "h"
    case TWO_DIGIT_MINIUTE = "mm"
    case ONE_OR_TWO_DIGIT_MINIUTE = "m"
    case TWO_DIGIT_SECOND = "ss"
    case ONE_OR_TWO_DIGIT_SECOND = "s"
    case AM_PM_12_HOUR_FORMAT = "a"

}
