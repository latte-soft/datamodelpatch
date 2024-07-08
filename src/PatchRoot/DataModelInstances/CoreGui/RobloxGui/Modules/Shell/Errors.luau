local l_LocalizedStrings_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("LocalizedStrings"));
return {
    Default = {
        Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
        Msg = l_LocalizedStrings_0:LocalizedString("DefaultErrorPhrase"), 
        Code = 0
    }, 
    GameJoin = {
        [-1] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("DefaultJoinFailPhrase"), 
            Code = 112
        }, 
        [1] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AlreadyRunningPhrase"), 
            Code = 101
        }, 
        [2] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("WebServerConnectFailPhrase"), 
            Code = 102
        }, 
        [3] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AccessDeniedByWeb"), 
            Code = 103
        }, 
        [4] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InstanceNotFound"), 
            Code = 104
        }, 
        [5] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("GameFullPhrase"), 
            Code = 105
        }, 
        [6] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("FollowUserFailed"), 
            Code = 106
        }, 
        [7] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InvalidPrivilegeMultiplayerSessionPhrase"), 
            Code = 107
        }, 
        [8] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InvalidPrivilegeUGCPhrase"), 
            Code = 108
        }, 
        [9] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AccessDeniedByWeb"), 
            Code = 109
        }, 
        [10] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AccessDeniedByWeb"), 
            Code = 110
        }, 
        [11] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AccessDeniedByWeb"), 
            Code = 111
        }, 
        [12] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("MPSRestrictedPhrase"), 
            Code = 113
        }, 
        [13] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("MPSBannedPhrase"), 
            Code = 114
        }, 
        [14] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("MPSPurchaseRequiredPhrase"), 
            Code = 115
        }, 
        [15] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UGCRestrictedPhrase"), 
            Code = 116
        }, 
        [16] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UGCBannedPhrase"), 
            Code = 117
        }, 
        [17] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("PrivilegeCheckFailPhrase"), 
            Code = 118
        }, 
        [18] = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InstanceNotFound"), 
            Code = 119
        }, 
        Default = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToJoinTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("DefaultJoinFailPhrase"), 
            Code = 112
        }
    }, 
    Vote = {
        FloodCheckThresholdMet = {
            Title = l_LocalizedStrings_0:LocalizedString("CannotVoteTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("VoteFloodPhrase"), 
            Code = 201
        }, 
        PlayGame = {
            Title = l_LocalizedStrings_0:LocalizedString("CannotVoteTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("VotePlayGamePhrase"), 
            Code = 202
        }
    }, 
    Favorite = {
        Failed = {
            Title = l_LocalizedStrings_0:LocalizedString("CannotFavoriteTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("DefaultErrorPhrase"), 
            Code = 301
        }, 
        FloodCheck = {
            Title = l_LocalizedStrings_0:LocalizedString("CannotFavoriteTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("FavoriteFloodPhrase"), 
            Code = 302
        }
    }, 
    Test = {
        CannotJoinGame = {
            Title = "An Error Occured", 
            Msg = "Cannot join games from studio.", 
            Code = 401
        }, 
        StillInDev = {
            Title = "An Error Occured", 
            Msg = "This feature is still in development.", 
            Code = 402
        }, 
        FeatureNotAvailableInStudio = {
            Title = "An Error Occured", 
            Msg = "This feature is not available in Roblox Studio.", 
            Code = 403
        }
    }, 
    PackageEquip = {
        Default = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToEquipTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UnableToEquipPhrase"), 
            Code = 501
        }
    }, 
    OutfitEquip = {
        Default = {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToWearOufitTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UnableToWearOufitPhrase"), 
            Code = 601
        }
    }, 
    PackagePurchase = {
        {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToDoPurchaseTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UnableToDoPurchasePhrase"), 
            Code = 701
        }
    }, 
    RobuxPurchase = {
        {
            Title = l_LocalizedStrings_0:LocalizedString("UnableToDoRobuxPurchaseTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UnableToDoRobuxPurchasePhrase"), 
            Code = 801
        }
    }, 
    Authentication = {
        [-1] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthErrorPhrase"), 
            Code = 901
        }, 
        [1] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthInProgressPhrase"), 
            Code = 902
        }, 
        [2] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthAccountUnlinkedPhrase"), 
            Code = 903
        }, 
        [3] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthMissingGamePadPhrase"), 
            Code = 904
        }, 
        [4] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthNoUserDetectedPhrase"), 
            Code = 905
        }, 
        [5] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthHttpErrorDetected"), 
            Code = 906
        }, 
        [6] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkSignUpDisabled"), 
            Code = 907
        }, 
        [7] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkFlooded"), 
            Code = 908
        }, 
        [8] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkLeaseLocked"), 
            Code = 909
        }, 
        [9] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkAccountLinkingDisabled"), 
            Code = 910
        }, 
        [10] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkInvalidRobloxUser"), 
            Code = 911
        }, 
        [11] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkRobloxUserAlreadyLinked"), 
            Code = 912
        }, 
        [12] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkXboxUserAlreadyLinked"), 
            Code = 913
        }, 
        [13] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkIllegalChildAccountLinking"), 
            Code = 914
        }, 
        [14] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkInvalidPassword"), 
            Code = 915
        }, 
        [15] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkUsernamePasswordNotSet"), 
            Code = 916
        }, 
        [16] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkUsernameAlreadyTaken"), 
            Code = 917
        }, 
        [17] = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("LinkInvalidCredentials"), 
            Code = 918
        }, 
        [18] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("UserIsGuestAccount"), 
            Code = 919
        }, 
        [19] = {
            Title = l_LocalizedStrings_0:LocalizedString("ReauthMaintenanceTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("ReauthMaintenancePhrase"), 
            Code = 920
        }, 
        [20] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = "To link your Xbox account, please go to your Roblox account settings on another device and turn off 2-step verification. Make sure to re-enable 2SV once you are linked to keep your account secure.", 
            Code = 921
        }, 
        [21] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("GlobalAccessDenied"), 
            Code = 922
        }
    }, 
    RegisterActiveUser = {
        [-1] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthErrorPhrase"), 
            Code = 1301
        }, 
        [1] = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("AuthNoUserDetectedPhrase"), 
            Code = 1302
        }
    }, 
    SignIn = {
        InvalidUsername = {
            Title = l_LocalizedStrings_0:LocalizedString("InvalidUsernameTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InvalidUsernamePhrase"), 
            Code = 1101
        }, 
        InvalidPassword = {
            Title = l_LocalizedStrings_0:LocalizedString("InvalidPasswordTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("InvalidPasswordPhrase"), 
            Code = 1102
        }, 
        NoUsernameOrPasswordEntered = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("NoUsernameOrPasswordEnteredPhrase"), 
            Code = 1107
        }, 
        ConnectionFailed = {
            Title = l_LocalizedStrings_0:LocalizedString("AuthenticationErrorTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("WebServerConnectFailPhrase"), 
            Code = 1108
        }
    }, 
    PlatformError = {
        PopupPartyUI = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("PopupPartyUIErrorPhrase"), 
            Code = 1201
        }
    }, 
    CPPSettingError = {
        SetCPPSettingError = {
            Title = l_LocalizedStrings_0:LocalizedString("ErrorOccurredTitle"), 
            Msg = l_LocalizedStrings_0:LocalizedString("SetCPPSettingErrorPhrase"), 
            Code = 1401
        }
    }
};
