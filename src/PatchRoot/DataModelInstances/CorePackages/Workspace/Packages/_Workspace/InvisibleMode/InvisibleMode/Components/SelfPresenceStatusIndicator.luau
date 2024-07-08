local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.dependencies);
local l_PresenceReducer_0 = v3.PresenceReducer;
local l_React_0 = v3.React;
local l_Text_0 = v3.Text;
local l_UIBlox_0 = v3.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useStyle_0 = v3.Hooks.useStyle;
local l_PresenceType_0 = l_PresenceReducer_0.Enums.PresenceType;
local v16 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v16.EventNames;
local l_useAnalytics_0 = v16.useAnalytics;
local function v23(v19, v20)
    if v19 then
        assert(typeof(v19) == "string", "expiryTimeIso is a string");
        local l_status_0, l_result_0 = pcall(function()
            return DateTime.fromIsoDate(v19);
        end);
        if l_status_0 and l_result_0 then
            assert(typeof(l_result_0) == "DateTime", "expiryDateTime is a DateTime");
            return l_result_0:FormatLocalTime("hh:mm A", v20);
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return function(v24)
    local v25 = l_useAnalytics_0();
    local v26 = l_useStyle_0();
    local l_CaptionHeader_0 = v26.Font.CaptionHeader;
    assert(v25 ~= nil, "SelfPresenceStatusIndicator must be wrapped in an AnalyticsProvider");
    local v28 = v23(v24.invisibleModeExpiry, l_LocalizationService_0.RobloxLocaleId);
    local v29 = l_useLocalization_0({
        gotIt = "Feature.Avatar.Action.GotIt", 
        invisible = "Common.Presence.Label.Invisible", 
        invisibleUntil = {
            "Feature.Profile.Label.InvisibleUntilTime"; 
            time = v28
        }, 
        online = "Common.Presence.Label.Online", 
        tooltip = {
            "Feature.Profile.Tooltip.InvisibleMode"; 
            time = v28
        }
    });
    local l_Color_0 = v26.Theme.OnlineStatus.Color;
    local v31 = l_Images_0["component_assets/circle_25"];
    local l_online_0 = v29.online;
    local l_Transparency_0 = v26.Theme.OnlineStatus.Transparency;
    if v24.presenceType == l_PresenceType_0.Invisible then
        l_Color_0 = v26.Theme.OfflineStatus.Color;
        v31 = l_Images_0["component_assets/circle_26_stroke_3"];
        l_online_0 = if not v28 then v29.invisible else v29.invisibleUntil;
        l_Transparency_0 = v26.Theme.OfflineStatus.Transparency;
    end;
    local v34 = v24.showText or false;
    local v35 = l_React_0.useMemo(function()
        if v34 then
            return (10 + l_Text_0.GetTextWidth(l_online_0, l_CaptionHeader_0.Font, l_CaptionHeader_0.RelativeSize * v26.Font.BaseSize)) + 12;
        else
            return 18;
        end;
    end, {
        v34, 
        l_online_0, 
        v26
    });
    local v36 = {
        bodyText = v29.tooltip, 
        buttonProps = {
            onActivated = v24.tooltipActivated, 
            text = v29.gotIt
        }
    };
    local v37 = {
        active = v24.showTooltip or false, 
        DisplayOrder = 10, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Top
    };
    l_useEffectOnce_0(function()
        v25.fireEvent(l_EventNames_0.InvisibleStateSeen, {
            surface = v24.surface
        });
    end, v24.presenceType == l_PresenceType_0.Invisible);
    l_useEffectOnce_0(function()
        v25.fireEvent(l_EventNames_0.InvisibleModeTooltipSeen, {
            surface = v24.surface
        });
    end, v24.showTooltip == true);
    return l_withTooltip_0(v36, v37, function(v38)
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v24.layoutOrder, 
            Size = UDim2.fromOffset(v35, 0)
        }, {
            TooltipTriggerPoint = l_React_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, 12), 
                Size = UDim2.fromOffset(0, 0), 
                [l_React_0.Change.AbsolutePosition] = v38, 
                [l_React_0.Change.AbsoluteSize] = v38
            }), 
            PlayerContext = l_React_0.createElement(l_PlayerContext_0, {
                fontStyle = l_CaptionHeader_0, 
                icon = v31, 
                iconColor = l_Color_0, 
                iconSize = UDim2.fromOffset(10, 10), 
                iconTransparency = l_Transparency_0, 
                onActivated = v24.onActivated, 
                text = if not v34 then nil else l_online_0
            })
        });
    end);
end;
