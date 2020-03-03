//
//  Localizable.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 13/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation

enum Localizable {

    enum Common {
        static let ok = NSLocalizedString("OK_KEY", comment: "Ok")
        static let cancel = NSLocalizedString("CANCEL_KEY", comment: "Cancel")
        static let done = NSLocalizedString("DONE_KEY", comment: "Done")
        static let skip = NSLocalizedString("SKIP_KEY", comment: "Skip")

        static let canceledByUser = NSLocalizedString("CANCELED_BY_USER_KEY", comment: "Canceled by user")

    }

    enum Login {
        static let emailPlaceholder = NSLocalizedString("LOGIN_EMAIL_PLACEHOLDER_KEY", comment: "Your email")
        static let passwordPlaceholder = NSLocalizedString("LOGIN_PASSWORD_PLACEHOLDER_KEY", comment: "Your password")
        static let forgotPassword = NSLocalizedString("LOGIN_FORGOT_PASSWORD_KEY", comment: "Forgot password?")
         static let newUser = NSLocalizedString("LOGIN_NEW_USER_KEY", comment: "New user?")

        static let logIn = NSLocalizedString("LOGIN_LOG_IN_KEY", comment: "Log in")
        static let signUp = NSLocalizedString("LOGIN_SIGN_UP_KEY", comment: "Sign Up")

        static let figureTitle = NSLocalizedString("LOGIN_FIGURE_TITLE_KEY", comment: "Figure title")
        static let figureSubtitle = NSLocalizedString("LOGIN_FIGURE_SUBTITLE_KEY", comment: "Figure subtitle")
    }
}
