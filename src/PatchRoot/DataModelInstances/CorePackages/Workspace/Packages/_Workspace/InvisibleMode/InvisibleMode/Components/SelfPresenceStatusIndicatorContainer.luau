local l_Parent_0 = script.Parent.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(l_Parent_0.dependencies);
local l_NetworkingPresence_0 = v2.NetworkingPresence;
local l_Otter_0 = v2.Otter;
local l_PresenceReducer_0 = v2.PresenceReducer;
local l_React_0 = v2.React;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_UIBlox_0 = v2.UIBlox;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useEffectOnce_0 = v2.Hooks.useEffectOnce;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useLocalUserId_0 = v2.Hooks.useLocalUserId;
local l_useScreenSize_0 = v2.Hooks.useScreenSize;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_useStyle_0 = v2.Hooks.useStyle;
local l_useTopBarHeight_0 = v2.Hooks.useTopBarHeight;
local l_PresenceType_0 = l_PresenceReducer_0.Enums.PresenceType;
local v23 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v23.EventNames;
local v25 = require(script.Parent.SelfPresenceStatusIndicator);
local l_useAnalytics_0 = v23.useAnalytics;
local l_FFlagInvisibleModeSetupEnabled_0 = require(l_Parent_0.Flags).FFlagInvisibleModeSetupEnabled;
local l_FIntInvisibleExpiryTimeHours_0 = require(l_Parent_0.Flags).FIntInvisibleExpiryTimeHours;
local v29 = l_Images_0["icons/actions/truncationCollapse_small"];
local v30 = l_Images_0["icons/actions/truncationExpand_small"];
local v31 = {
    motorCallback = l_Otter_0.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
local function _(v32)
    v32 = v32 or l_AppStorageService_0;
    assert(v32 ~= nil, "AppStorageService is not nil");
    local l_status_0, l_result_0 = pcall(function()
        return v32:GetItem("InvisibleModeTooltipShown");
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == "true";
    end;
end;
local function _(v36, v37)
    v36 = v36 or l_AppStorageService_0;
    assert(v36 ~= nil, "AppStorageService is not nil");
    pcall(function()
        v36:SetItem("InvisibleModeTooltipShown", (tostring(v37)));
        v36:Flush();
    end);
end;
return (v23.wrapWithAnalyticsProvider(function(v39)
    local v40 = l_useAnalytics_0();
    local v41 = l_useDispatch_0();
    local v42 = l_useLocalization_0({
        invisibleWithTimeout = {
            "Feature.Profile.Label.InvisibleWithTimeout"; 
            hours = l_FIntInvisibleExpiryTimeHours_0
        }, 
        online = "Common.Presence.Label.Online", 
        somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    local v43 = l_useScreenSize_0();
    local v44 = l_useTopBarHeight_0();
    assert(v40 ~= nil, "SelfPresenceStatusIndicatorContainer must be wrapped in AnalyticsProvider");
    if v43 == nil then
        v43 = Vector2.new(0, 0);
    end;
    local v45 = l_React_0.useCallback(function()
        if v39.showToast ~= nil then
            v39.showToast(v42.somethingIsWrong);
        end;
    end, {
        v39.showToast, 
        v42.somethingIsWrong
    });
    local v46 = l_useLocalUserId_0();
    local v48 = l_useSelector_0(function(v47)
        if v46 == nil then
            return nil;
        elseif l_FFlagInvisibleModeSetupEnabled_0 or v47.InvisibleMode then
            return (l_getDeepValue_0(v47, string.format("InvisibleMode.Presence.byUserId.%s", v46)));
        else
            return nil;
        end;
    end);
    l_React_0.useEffect(function()
        if v46 and v48 == nil then
            v41(l_NetworkingPresence_0.GetPresencesFromUserIds.API({
                v46
            })):catch(v45);
        end;
    end, {
        v46, 
        v48
    });
    local v49 = nil;
    local l_Online_0 = l_PresenceType_0.Online;
    if v48 then
        v49 = v48.invisibleModeExpiry;
        l_Online_0 = v48.userPresenceType;
    end;
    local function v52(v51)
        v41(l_NetworkingPresence_0.SetInvisibilityStatus.API(v51)):andThen(function()
            v41(l_NetworkingPresence_0.GetPresencesFromUserIds.API({
                v46
            }));
        end):catch(v45);
    end;
    local v53, v54 = l_React_0.useState(false);
    local v55 = l_useStyle_0();
    local v56 = if not v53 then v55.Theme.TextDefault else v55.Theme.TextEmphasis;
    local v57 = l_React_0.useCallback(function()
        v54(not v53);
    end, {
        v53, 
        v54
    });
    local v58, v59 = l_React_0.useState(UDim2.fromScale(0, 0));
    local v60 = l_React_0.useCallback(function()
        v40.fireEvent(l_EventNames_0.InvisibleModeInteracted, {
            invisibleModeActivated = "true", 
            surface = v39.surface
        });
        if l_Online_0 ~= l_PresenceType_0.Invisible then
            v52(true);
        end;
        v57();
    end, {
        v52, 
        l_Online_0, 
        v57
    });
    local v61 = l_React_0.useCallback(function()
        if l_Online_0 ~= l_PresenceType_0.Online then
            v40.fireEvent(l_EventNames_0.InvisibleModeInteracted, {
                invisibleModeActivated = "false", 
                surface = v39.surface
            });
            v52(false);
        end;
        v57();
    end, {
        v52, 
        l_Online_0, 
        v57
    });
    local v66 = l_React_0.useCallback(function(v62)
        local l_AbsoluteSize_0 = v62.AbsoluteSize;
        local v64 = UDim.new(0, l_AbsoluteSize_0.Y);
        local v65 = UDim.new(0, l_AbsoluteSize_0.X);
        if v39.width then
            v65 = v39.width;
        end;
        v59(UDim2.new(v65, v64));
    end, {
        v39.width, 
        v59
    });
    local v67, v68 = l_React_0.useState(0);
    local v71 = l_React_0.useCallback(function(v69)
        local v70 = math.floor(v69.AbsolutePosition.Y);
        if v70 ~= v67 then
            v68(v70);
            if v53 then
                v54(false);
            end;
        end;
    end, {
        v67, 
        v68, 
        v53, 
        v54
    });
    local v72, v73 = l_React_0.useState(false);
    l_React_0.useEffect(function()
        if not (l_Online_0 == l_PresenceType_0.Invisible) or not v39.showText then
            v73(false);
            return ;
        else
            local v74 = v39.appStorageService or l_AppStorageService_0;
            assert(v74 ~= nil, "AppStorageService is not nil");
            local l_status_1, l_result_1 = pcall(function()
                return v74:GetItem("InvisibleModeTooltipShown");
            end);
            local v77;
            if not l_status_1 or l_result_1 == nil then
                v77 = false;
                --[[ close >= 1 ]]
            else
                v77 = l_result_1 == "true";
                --[[ close >= 1 ]]
            end;
            v73(not v77);
            return ;
        end;
    end, {
        l_Online_0, 
        v39.showText
    });
    local v81 = l_React_0.useCallback(function()
        v40.fireEvent(l_EventNames_0.InvisibleModeTooltipInteracted, {
            surface = v39.surface
        });
        v73(false);
        local v78 = v39.appStorageService or l_AppStorageService_0;
        assert(v78 ~= nil, "AppStorageService is not nil");
        local l_pcall_0 = pcall;
        local v80 = true;
        l_pcall_0(function()
            v78:SetItem("InvisibleModeTooltipShown", (tostring(v80)));
            v78:Flush();
        end);
    end, {
        v73
    });
    local l_l_useEffectOnce_0_0 = l_useEffectOnce_0;
    local function v83()
        v40.fireEvent(l_EventNames_0.InvisibleModeViewed, {
            surface = v39.surface
        });
    end;
    local v84 = false;
    if v39.showText == true then
        v84 = v39.isInteractable == true;
    end;
    l_l_useEffectOnce_0_0(v83, v84);
    l_l_useEffectOnce_0_0 = l_MenuDirection_0.Up;
    v83 = 0;
    v84 = -2;
    if v67 <= v44 + 114 then
        l_l_useEffectOnce_0_0 = l_MenuDirection_0.Down;
        v83 = 1;
        v84 = 2;
    end;
    return l_React_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v39.layoutOrder, 
        Size = v58, 
        ZIndex = v39.ZIndex, 
        [l_React_0.Change.AbsolutePosition] = v71
    }, {
        ContextualMenuFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, -24, v83, 0), 
            Size = UDim2.fromScale(1, 0)
        }, {
            MaxWidthConstraint = l_React_0.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(360, 0), 
                MinSize = Vector2.new(250, 0)
            }), 
            ContextMenu = l_React_0.createElement(l_ContextualMenu_0, {
                buttonProps = {
                    {
                        onActivated = v61, 
                        selected = l_Online_0 ~= l_PresenceType_0.Invisible, 
                        text = v42.online
                    }, 
                    {
                        onActivated = v60, 
                        selected = l_Online_0 == l_PresenceType_0.Invisible, 
                        text = v42.invisibleWithTimeout
                    }
                }, 
                closeBackgroundVisible = false, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                menuDirection = l_l_useEffectOnce_0_0, 
                motorOverrideOptions = v31, 
                onDismiss = v57, 
                open = v53, 
                openPositionY = UDim.new(1, -v84), 
                screenSize = v43
            })
        }), 
        InteractableArea = l_React_0.createElement("ImageButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(0, 0), 
            [l_React_0.Change.AbsoluteSize] = v66, 
            [l_React_0.Event.Activated] = if not v39.isInteractable then nil else v57
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            StatusIndicator = l_React_0.createElement(v25, {
                invisibleModeExpiry = v49, 
                layoutOrder = 1, 
                onActivated = if not v53 then nil else v57, 
                presenceType = l_Online_0, 
                showText = v39.showText, 
                showTooltip = v72, 
                surface = v39.surface, 
                tooltipActivated = v81
            }), 
            InteractionIcon = if not v39.isInteractable then nil else l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = if not v53 then v30 else v29, 
                ImageColor3 = v56.Color, 
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(16, 16)
            })
        })
    });
end));
