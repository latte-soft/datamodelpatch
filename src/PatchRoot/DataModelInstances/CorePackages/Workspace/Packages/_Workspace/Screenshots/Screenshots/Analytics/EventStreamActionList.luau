local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
return {
    [v5.CapturesActivatedInGameMenu] = {
        additionalInfo = {
            btn = v5.CapturesActivatedInGameMenu
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselClosed] = {
        additionalInfo = {
            btn = v5.CapturesCarouselClosed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselClosedByKeyboard] = {
        additionalInfo = {
            btn = v5.CapturesCarouselClosedByKeyboard
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselNavigated] = {
        additionalInfo = {
            btn = v5.CapturesCarouselNavigated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v5.CapturesCarouselNavigatedByKeyboard] = {
        additionalInfo = {
            btn = v5.CapturesCarouselNavigatedByKeyboard
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v5.CapturesCarouselOpened] = {
        additionalInfo = {
            btn = v5.CapturesCarouselOpened
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselPostActivated] = {
        additionalInfo = {
            btn = v5.CapturesCarouselPostActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v5.CapturesCarouselSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesCarouselScrolled] = {
        additionalInfo = {
            btn = v5.CapturesCarouselScrolled
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v5.CapturesCarouselShareActivated] = {
        additionalInfo = {
            btn = v5.CapturesCarouselShareActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeactivatedInGameMenu] = {
        additionalInfo = {
            btn = v5.CapturesDeactivatedInGameMenu
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeleteActivatedInCaptureManager] = {
        additionalInfo = {
            btn = v5.CapturesDeleteActivatedInCaptureManager
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeleteActivatedInCarousel] = {
        additionalInfo = {
            btn = v5.CapturesDeleteActivatedInCarousel
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeleteWarningModalCancelPressed] = {
        additionalInfo = {
            btn = v5.CapturesDeleteWarningModalCancelPressed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeleteWarningModalDeletePressed] = {
        additionalInfo = {
            btn = v5.CapturesDeleteWarningModalDeletePressed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDeleteWarningModalOptedOut] = {
        additionalInfo = {
            btn = v5.CapturesDeleteWarningModalOptedOut
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesDesktopHotkeyCaptureTriggered] = {
        additionalInfo = {
            btn = v5.CapturesDesktopHotkeyCaptureTriggered
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesEntrypointActivated] = {
        additionalInfo = {
            btn = v5.CapturesEntrypointActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesEntrypointDragged] = {
        additionalInfo = {
            btn = v5.CapturesEntrypointDragged
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesEntrypointViewed] = {
        additionalInfo = {
            btn = v5.CapturesEntrypointViewed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v5.CapturesManagerBulkSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v5.CapturesManagerBulkSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesManagerItemActivated] = {
        additionalInfo = {
            btn = v5.CapturesManagerItemActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesManagerOpened] = {
        additionalInfo = {
            btn = v5.CapturesManagerOpened
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesManagerSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v5.CapturesManagerSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesManagerSelectAllActivated] = {
        additionalInfo = {
            btn = v5.CapturesManagerSelectAllActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesManagerShareActivated] = {
        additionalInfo = {
            btn = v5.CapturesManagerShareActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesMigratedLegacyVideoRecordActivated] = {
        additionalInfo = {
            btn = v5.CapturesMigratedLegacyVideoRecordActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesMigratedLegacyVideoRecordDeactivated] = {
        additionalInfo = {
            btn = v5.CapturesMigratedLegacyVideoRecordDeactivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesPageOpenedInGameMenu] = {
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.PageLoad
    }, 
    [v5.CapturesShareFromNonStandardServer] = {
        additionalInfo = {
            btn = v5.CapturesShareFromNonStandardServer
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesSavePermissionModalAllowPressed] = {
        additionalInfo = {
            btn = v5.CapturesSavePermissionModalAllowPressed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesSavePermissionModalCancelPressed] = {
        additionalInfo = {
            btn = v5.CapturesSavePermissionModalCancelPressed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesSavedToDeviceToastOpenButtonActivated] = {
        additionalInfo = {
            btn = v5.CapturesSavedToDeviceToastOpenButtonActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesShareToastButtonActivated] = {
        additionalInfo = {
            btn = v5.CapturesShareToastButtonActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesShareToastViewed] = {
        additionalInfo = {
            btn = v5.CapturesShareToastViewed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v5.CapturesShowMoreInGameMenu] = {
        additionalInfo = {
            btn = v5.CapturesShowMoreInGameMenu
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.CapturesViewToastButtonActivated] = {
        additionalInfo = {
            btn = v5.CapturesViewToastButtonActivated
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.SaveCapturesPromptAccepted] = {
        additionalInfo = {
            btn = v5.SaveCapturesPromptAccepted
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            savedCaptures = v1.identity, 
            totalCaptures = v1.identity
        }
    }, 
    [v5.SaveCapturesPromptRejected] = {
        additionalInfo = {
            btn = v5.SaveCapturesPromptRejected
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.SaveCapturesPromptViewed] = {
        additionalInfo = {
            btn = v5.SaveCapturesPromptViewed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v5.ShareCaptureGenerateLinkFailed] = {
        additionalInfo = {
            btn = v5.ShareCaptureGenerateLinkFailed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.GenerateLinkFailed, 
        formatRulesForAdditionalInfo = {
            httpError = v1.identity
        }
    }, 
    [v5.ShareCapturePromptAccepted] = {
        additionalInfo = {
            btn = v5.ShareCapturePromptAccepted
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.ShareCapturePromptRejected] = {
        additionalInfo = {
            btn = v5.ShareCapturePromptRejected
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v5.ShareCapturePromptViewed] = {
        additionalInfo = {
            btn = v5.ShareCapturePromptViewed
        }, 
        context = l_Contexts_0.Screenshots, 
        eventType = l_EventTypes_0.UserSeen
    }
};
