local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_GetFFlagReportAnythingAbuseVectorRenameEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagReportAnythingAbuseVectorRenameEnabled;
local v4 = {
    AbuseReportMenuRootName = "AbuseReportMenuNew", 
    ModalBaseSelectorDialogRootName = "ModalBaseSelectorDialog", 
    ReportModes = {
        Classic = "Classic", 
        SelectInScene = "SelectInScene"
    }, 
    ReportTypes = {
        Person = "Person", 
        Experience = "Experience"
    }, 
    PlayerAbuseTypes = {
        Swearing = "Swearing", 
        Username = "Inappropriate Username", 
        Bullying = "Bullying", 
        Scamming = "Scamming", 
        Dating = "Dating", 
        Cheating = "Cheating/Exploiting", 
        Personal = "Personal Question", 
        Links = "Offsite Links"
    }, 
    PlayerVoiceAbuseTypes = {
        Swearing = "Swearing", 
        Username = "Inappropriate Username", 
        Bullying = "Bullying", 
        Scamming = "Scamming", 
        Dating = "Dating", 
        Cheating = "Cheating/Exploiting", 
        Personal = "Personal Question"
    }, 
    AbuseMethods = {
        TextChat = "Text Chat", 
        VoiceChat = "Voice Chat", 
        Other = "Other", 
        Avatar = "Avatar"
    }
};
v4.AbuseMethodToVectorMapping = {
    [v4.AbuseMethods.TextChat] = "chat", 
    [v4.AbuseMethods.VoiceChat] = "voice", 
    [v4.AbuseMethods.Other] = "other", 
    [v4.AbuseMethods.Avatar] = not l_GetFFlagReportAnythingAbuseVectorRenameEnabled_0() and "other" or "avatar"
};
v4.AnalyticsAbuseMethods = {
    Chat = "Chat", 
    Voice = "Voice", 
    Other = "Other", 
    Game = "Game"
};
v4.AbuseMethodToAnalyticsMapping = {
    [v4.AbuseMethods.TextChat] = v4.AnalyticsAbuseMethods.Chat, 
    [v4.AbuseMethods.VoiceChat] = v4.AnalyticsAbuseMethods.Voice, 
    [v4.AbuseMethods.Other] = v4.AnalyticsAbuseMethods.Other, 
    [v4.AbuseMethods.Avatar] = v4.AnalyticsAbuseMethods.Other
};
v4.AbuseMethodSublabel = {
    TextChat = "This person typed a mean word in text chat", 
    VoiceChat = "This person was screaming on top of their lungs", 
    Other = "This person is following me, wearing a bad shirt, etc.", 
    Avatar = "This person's avatar is wearing offensive clothing"
};
v4.PlayerMenuActions = {
    UpdateAbuseReason = "UpdateAbuseReason", 
    UpdateComment = "UpdateComment", 
    UpdateMethodOfAbuse = "UpdateMethodOfAbuse", 
    UpdateAbuser = "UpdateAbuser", 
    UpdatePlayerNameMap = "UpdatePlayerNameMap", 
    SetVoiceEnabled = "SetVoiceEnabled", 
    ClearState = "ClearState", 
    SetShowModalSelector = "SetShowModalSelector", 
    SetMenuOpenTimestamp = "SetMenuOpenTimestamp", 
    SetPreselectedPlayer = "SetPreselectedPlayer"
};
v4.ReportAnythingActions = {
    ClearAll = "ClearAll", 
    ClearAnnotationFlowProperties = "ClearAnnotationFlowProperties", 
    SetScreenshotId = "SetScreenshotId", 
    SetScreenshotContentId = "SetScreenshotContentId", 
    SetAnnotationPoints = "SetAnnotationPoints", 
    SetIdentificationResults = "SetIdentificationResults", 
    CompleteAttachment = "CompleteAttachment", 
    SetAnnotationAreaDimensions = "SetAnnotationAreaDimensions", 
    SetAnnotationCircleRadius = "SetAnnotationCircleRadius", 
    SetAnnotationOptionSeen = "SetAnnotationOptionSeen"
};
v4.AnalyticsActions = {
    Reset = "Reset", 
    SetMenuOpenedTimestamp = "SetMenuOpenedTimestamp", 
    IncrementExperiencePersonChanged = "IncrementExperiencePersonChanged", 
    IncrementTypeofabuseChanged = "IncrementTypeofabuseChanged", 
    IncrementPersonChanged = "IncrementPersonChanged", 
    IncrementReasonChanged = "IncrementReasonChanged", 
    IncrementCaptureScene = "IncrementCaptureScene", 
    SetViewportInformation = "SetViewportInformation", 
    SetSubmissionCompleted = "SetSubmissionCompleted", 
    SetTypeOfAbuseSelection = "SetTypeOfAbuseSelection", 
    SetReasonSelection = "SetReasonSelection", 
    SetCommentAdded = "SetCommentAdded", 
    SwitchToExperienceInitialSelections = "SwitchToExperienceInitialSelections", 
    SwitchToPersonInitialSelections = "SwitchToPersonInitialSelections"
};
v4.InappropriateContentAbuseReason = "Inappropriate Content";
v4.ReportSuccessToast = {
    ReportAnythingGeneric = "We\226\128\153ve received your report and will take action soon if needed. Your feedback helps keep our community safe.", 
    ChatGeneric = "Thanks for your report Our moderators will review the chat logs and evaluate what happened.", 
    Cheating = "Thanks for your report We've recorded your report for evaluation.", 
    BadUserName = "Thanks for your report Our moderators will evaluate the username.", 
    Place = "Thanks for your report Our moderators will review the place and make a determination."
};
v4.InitialIdentificationResults = {
    identifiedAvatars = {}, 
    identifiedAds = {}, 
    avatarIDStats = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    }, 
    adIDStats = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    }
};
v4.ReportAnythingInitialState = {
    identificationResults = v4.InitialIdentificationResults, 
    screenshotId = "", 
    screenshotContentId = "", 
    attachCompleted = false, 
    annotationPoints = {}
};
v4.AnalyticsInitialState = {
    menuEverShown = false, 
    menuOpenedUnixTimestampMilliseconds = 0, 
    experiencePersonChangeCount = 0, 
    typeofabuseChangeCount = 0, 
    personChangeCount = 0, 
    reasonChangeCount = 0, 
    captureSceneCount = 0, 
    viewportSizeX = -1, 
    viewportSizeY = -1, 
    isPortraitMode = false, 
    isSubmissionCompleted = false, 
    typeofabuseSelection = nil, 
    reasonSelection = nil, 
    commentAdded = false, 
    experiencePersonSelection = nil
};
v4.AnalyticsPersonInitialSelections = {
    typeofabuseSelection = nil, 
    reasonSelection = nil, 
    commentAdded = false, 
    experiencePersonSelection = string.lower(v4.ReportTypes.Person)
};
v4.AnalyticsExpeirenceInitialSelections = {
    typeofabuseSelection = v4.AnalyticsAbuseMethods.Game, 
    reasonSelection = v4.InappropriateContentAbuseReason, 
    commentAdded = false, 
    experiencePersonSelection = string.lower(v4.ReportTypes.Experience)
};
v4.AbuseVector = {
    Voice = "voice"
};
v4.MenuItemHeight = 42;
v4.MenuItemHeightTight = 36;
v4.FreeCommentsMenuItemHeight = 60;
v4.FieldLabelSize = 18;
v4.LeftContainerWidth = 240;
v4.RightContainerWidth = 300;
v4.MenuItemDynamicWidthOffset = 100;
v4.FieldLabelSizeSmall = 16;
v4.LeftContainerWidthSmall = 100;
v4.RightContainerWidthSmall = 180;
v4.SmallLayoutThreshold = 540;
v4.InitPersonUIState = {
    reportType = v4.ReportTypes.Person, 
    comment = "", 
    playerObjects = {}, 
    menuContainerWidth = 0, 
    allegedAbuserId = nil, 
    allegedAbuser = nil, 
    abuseReason = nil, 
    methodOfAbuse = nil, 
    isVoiceEnabled = nil, 
    menuOpenedUnixTimestampMilliseconds = nil, 
    modalSelectorCellData = nil, 
    isModalSelectorShown = nil, 
    preselectedPlayer = nil
};
v4.InitExperienceUIState = {
    reportType = v4.ReportTypes.Experience, 
    comment = "", 
    abuseReason = v4.InappropriateContentAbuseReason, 
    menuContainerWidth = 0
};
return v4;
