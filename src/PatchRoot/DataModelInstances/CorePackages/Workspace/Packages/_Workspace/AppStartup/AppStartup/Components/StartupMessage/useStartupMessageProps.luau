local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppStartupMessageService_0 = require(l_Parent_0.RoactServiceTags).AppStartupMessageService;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_GetFFlagFixStartupMessageLinking_0 = require(l_Parent_0.SharedFlags).GetFFlagFixStartupMessageLinking;
local v15 = game:DefineFastFlag("StartupMessageDateLocalization", false);
local function v17(v16)
    return v16.ScreenSize;
end;
return function()
    local v18 = l_useRoactService_0(l_AppLinking_0);
    local v19 = l_useRoactService_0(l_AppLogging_0);
    local v20 = l_useRoactService_0(l_AppStartupMessageService_0);
    local v21 = l_useSelector_0(v17);
    local v22 = if not l_GetFFlagFixStartupMessageLinking_0() then nil else l_useDispatch_0();
    local v24 = l_useDesignTokens_0(function(v23)
        return v23.Semantic.Color.Common.Overlay;
    end);
    local v25, v26 = v3.useState(false);
    local v27, v28 = v3.useState(false);
    local v29 = v20:getStartupMessage();
    local v30 = not not v29 and (not v25 or false);
    local v31 = v29 or {};
    local l_titleLocalizationKey_0 = v31.titleLocalizationKey;
    local l_bodyLocalizationKey_0 = v31.bodyLocalizationKey;
    local l_loggingEventName_0 = v31.loggingEventName;
    local v35 = v31.links or {};
    local v37 = l_useLocalization_0(v2.map(v35, function(v36)
        return v36.localizationKey;
    end));
    local v41 = v2.reduce(v35, function(v38, v39, v40)
        return v2.append(v38, {
            {
                label = v37[v40], 
                url = v39.url
            }
        });
    end, {});
    local l_date_0 = v31.date;
    if v15 then
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        local v44 = tonumber(v31.date);
        if v44 then
            l_date_0 = DateTime.fromUnixTimestamp(v44):FormatUniversalTime("LL", l_RobloxLocaleId_0);
        end;
    end;
    local v45 = l_useLocalization_0({
        titleText = l_titleLocalizationKey_0, 
        bodyText = l_bodyLocalizationKey_0 and {
            l_bodyLocalizationKey_0; 
            date = l_date_0
        }, 
        buttonText = "CommonUI.Messages.Action.Dismiss"
    });
    local v46 = v3.useCallback(function()
        v26(true);
    end, {});
    local v50 = v3.useCallback(function(v47, v48)
        if not l_GetFFlagFixStartupMessageLinking_0() then
            v18:openURL(v47);
            return ;
        else
            v18:isURLRegistered(v47):andThen(function(v49)
                if not v49 then
                    v22(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v47, 
                        extraProps = {
                            title = v48
                        }
                    }));
                    return ;
                else
                    v18:detectURL(v47);
                    return ;
                end;
            end);
            return ;
        end;
    end, if not l_GetFFlagFixStartupMessageLinking_0() then {
        v18
    } else {
        v22, 
        v18
    });
    v3.useEffect(function()
        if not ((v27 or not v30) or not l_loggingEventName_0) then
            v19:logEphemeralCounterEvent({
                eventName = l_loggingEventName_0, 
                backends = {
                    "EphemeralCounter"
                }, 
                lastUpdated = {
                    24, 
                    2, 
                    18
                }, 
                description = "Startup Message Displayed Event"
            });
            v28(true);
        end;
    end, {
        v27, 
        v30, 
        l_loggingEventName_0
    });
    return {
        displayStartupMessage = v30, 
        screenSize = v21, 
        message = v31, 
        localizedStrings = v45, 
        localizedLinks = v41, 
        overlayColor = v24, 
        onDismissed = v46, 
        onOpenUrl = v50
    };
end;
