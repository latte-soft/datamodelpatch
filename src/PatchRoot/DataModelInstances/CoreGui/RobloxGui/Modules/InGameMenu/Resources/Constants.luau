local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v3 = {
    MouseAndKeyboard = "MouseAndKeyboard", 
    Touch = "Touch", 
    Gamepad = "Gamepad"
};
return {
    InviteStatus = {
        Success = "Success", 
        Moderated = "Moderated", 
        Failed = "Failed", 
        Pending = "Pending"
    }, 
    InputType = v3, 
    FallbackLocaleId = "UNKNOWN_FALLBACK", 
    defaultPageKey = "InitalPage", 
    advancedSettingsPageKey = "AdvancedGameSettings", 
    vrComfortSettingsPageKey = "VRGameSettings", 
    LeaveToAppPromptPageKey = "LeaveToAppPrompt", 
    LeaveGamePromptPageKey = "LeaveGamePrompt", 
    MainPagePageKey = "MainPage", 
    InitalPageKey = "InitalPage", 
    ReportDialogKey = "ReportDialog", 
    AnalyticsTargetName = "client", 
    AnalyticsInGameMenuName = "ingame_menu", 
    AnalyticsRespawnCharacterName = "respawn_character", 
    AnalyticsSettingsChangeName = "change_ingame_settings", 
    AnalyticsExplicitSettingsChangeName = "change_explicit_ingame_settings", 
    AnalyticsSettingsSafetyBubbleModeChangeName = "change_ingame_settings_safety_bubble_mode", 
    AnalyticsSettingsVRComfortSettingChangeName = "change_ingame_settings_vr_comfort_setting", 
    AnalyticsFullscreenModeName = "FullscreenMode", 
    AnalyticsMenuActionName = "ingame_menu_action", 
    AnalyticsMenuOpenName = "menu_open", 
    AnalyticsMenuOpenTypes = {
        Keyboard = "KeyboardShortcut", 
        TopbarButton = "TopbarButton", 
        ReportAbuseTriggered = "ReportAbuse", 
        PlayersTriggered = "Players", 
        SettingsTriggered = "Settings", 
        EducationalMenuTriggered = "EducationalMenu", 
        GamepadLeaveGame = "GamepadLeaveGame", 
        GamepadResetCharacter = "GamepadResetCharacter", 
        ScreenshotUnhide = "ScreenshotUnhide"
    }, 
    AnalyticsMenuCloseName = "menu_close", 
    AnalyticsLeaveGameName = "leave_game", 
    AnalyticsLeaveToHomeName = "leave_to_home", 
    AnalyticsLeaveToHomeSource = "home", 
    AnalyticsLeaveGameSource = "leave", 
    AnalyticsResumeGameName = "resume", 
    AnalyticsResumeShieldSource = "shield", 
    AnalyticsResumeButtonSource = "button", 
    AnalyticsResumeGamepadSource = "gamepad", 
    AnalyticsConfirmedName = "confirmed", 
    AnalyticsCancelledName = "cancelled", 
    AnalyticsReportLeft = "ingame_menu_report_left", 
    AnalyticsReportSubmittedName = "ingame_menu_report_submitted", 
    AnalyticsRequestFriendName = "RequestFriendship", 
    AnalyticsRequestFriendContext = "PlayersMenu", 
    AnalyticsExamineAvatarName = "examine_avatar", 
    PlayerScriptStatusStrings = {
        Default = "PlayerScript Status: Default", 
        Custom = "PlayerScript Status: Custom", 
        PossiblyCustom = "PlayerScript Status: Possibly Custom", 
        CustomOld = "PlayerScript Status: Custom Old"
    }, 
    ControllerBarHeight = 72, 
    DisplayOrder = {
        RootMenu = 1, 
        BlurredModalPortal = 2, 
        FullscreenTitleBar = 7, 
        ConfirmationDialog = 8, 
        EducationalPopup = 9, 
        HeadsetDisconnectedDialog = 100, 
        ControllerBar = 9
    }, 
    ShieldOpenAnimationTweenTime = 0.5, 
    ShieldCloseAnimationTweenTime = 0.4, 
    ShieldOpenFadeTime2 = 0.25, 
    ShieldCloseFadeTime2 = 0.15, 
    ShieldExtraFadeTime = 0.05, 
    Zone = {
        PortalSize = 1, 
        ContentOffset = 2
    }, 
    InputTypeMap = {
        [Enum.UserInputType.MouseButton1] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.MouseButton2] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.MouseButton3] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.MouseWheel] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.MouseMovement] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.Keyboard] = v3.MouseAndKeyboard, 
        [Enum.UserInputType.Gamepad1] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad2] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad3] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad4] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad5] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad6] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad7] = v3.Gamepad, 
        [Enum.UserInputType.Gamepad8] = v3.Gamepad, 
        [Enum.UserInputType.Touch] = v3.Touch
    }, 
    FramerateCaps = {
        60, 
        120, 
        144, 
        240
    }, 
    OnSurveyEventDescriptor = {
        mid = l_MessageBus_0.getMessageId("Game", "openSurvey"), 
        validateParams = v1.strictInterface({
            eventType = v1.string, 
            userId = v1.optional(v1.string), 
            customProps = v1.optional(v1.table)
        })
    }, 
    SurveyEventType = "leaveButtonClick", 
    ChromeSeenCountKey = "ChromeSeenCount"
};
