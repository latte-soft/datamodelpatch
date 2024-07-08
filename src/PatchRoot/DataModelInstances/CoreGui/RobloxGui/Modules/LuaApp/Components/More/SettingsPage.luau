local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.Common.memoize);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v10 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v11 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Components.More.MoreList);
local v16 = require(l_Modules_0.LuaApp.Components.More.MoreItemContainer);
local v17 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v19 = require(l_CorePackages_0.Packages.React);
local v20 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v21 = require(l_Modules_0.LuaApp.Hooks.useSettingsPageItems);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v23 = require(l_Modules_0.LuaApp.Components.More.MoreSectionList);
local l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAgeVerificationFlowFromVoiceEligibleGames;
local v25 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_SetShowAgeVerificationOverlay_0 = v25.AgeVerificationOverlay.SetShowAgeVerificationOverlay;
local l_SetVoiceChatOptInStatus_0 = v25.OptInStatus.SetVoiceChatOptInStatus;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableParentalControlExperiment);
local l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootMoreSettingsAndAboutRefactor;
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableGateNotificationPreferencesTab;
local v31 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v32 = v4.PureComponent:extend("SettingsPage");
v32.init = function(v33)
    v33.renderItem = function(v34, v35)
        return v4.createElement(v16, {
            item = v34, 
            layoutInfo = v35
        });
    end;
    v33.getSettingsPageItemList = v7(function(v36, v37, v38)
        return v3.List.map(v9.GetItemsInPage(v37, nil, nil, if not l_GetFFlagEnableGateNotificationPreferencesTab_0() then nil else {
            enableNotificationPreferencesTab = v33.props.enableNotificationPreferencesTab
        }, v38), function(v39)
            local l_contents_0 = v39.contents;
            local v41 = {};
            for v42, v43 in ipairs(l_contents_0) do
                if v43.itemType == v9.ItemType.Settings_AccountInfo and v43.badgeCount ~= v36 then
                    v43 = v3.Dictionary.join(v43, {
                        badgeCount = v36
                    });
                end;
                v41[v42] = v43;
            end;
            return v41;
        end);
    end);
    if l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0() then
        v33.props.setShowAgeVerificationOverlay();
    end;
    v33.props.setVoiceChatOptInStatus();
end;
v32.render = function(v44)
    local v45 = v44.props.formFactor == l_FormFactor_0.WIDE;
    local v46 = v44.getSettingsPageItemList(v44.props.notificationCount, v44.props.settingsPageType, v44.props.showParentalControls);
    local v47 = 0;
    local v48 = 0;
    local l_MORE_PAGE_SECTION_PADDING_0 = v8.MORE_PAGE_SECTION_PADDING;
    local l_MORE_PAGE_SECTION_PADDING_1 = v8.MORE_PAGE_SECTION_PADDING;
    if v45 then
        v47 = v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        v48 = v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        l_MORE_PAGE_SECTION_PADDING_0 = v8.MORE_PAGE_WIDE_PADDING_VERTICAL;
        l_MORE_PAGE_SECTION_PADDING_1 = v8.MORE_PAGE_WIDE_PADDING_VERTICAL;
    end;
    local v51 = (v8.MORE_PAGE_CONTENT_MAX_WIDTH + v47) + v48;
    local function v54(v52)
        local v53 = v4.createElement(v17, {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            maxWidth = v51
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v47), 
                PaddingRight = UDim.new(0, v48), 
                PaddingTop = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_0), 
                PaddingBottom = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_1)
            }), 
            SettingsPageList = v4.createElement(v15, {
                itemList = v46, 
                renderItem = v44.renderItem, 
                rowHeight = v8.MORE_PAGE_ROW_HEIGHT
            })
        });
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v52.Color, 
            BackgroundTransparency = v52.Transparency
        }, {
            TopBar = if not v31 then v4.createElement(v14.Container, {
                leftItem = v14.BackButton, 
                rightItems = {
                    v14.BuyRobuxButton, 
                    v14.NotificationsButton
                }
            }) else nil, 
            PageContent = if not v31 then v4.createElement(v14.PageContent, {}, {
                Scroller = v53
            }) else v53
        });
    end;
    return l_withStyle_0(function(v55)
        return v54(v55.Theme.BackgroundDefault);
    end);
end;
v32 = l_RoactAppPolicy_0.connect(function(v56, _)
    return {
        settingsPageType = v56.getSettingsPageType(), 
        enableNotificationPreferencesTab = if not l_GetFFlagEnableGateNotificationPreferencesTab_0() then nil else v56.getEnableNotificationPreferencesPage()
    };
end)(v32);
if v28() then
    v32 = v10.connectUserLayer({
        v11.ParentalSpendControlsLayer
    }, function(v58, _)
        return {
            showParentalControls = (v58[v11.ParentalSpendControlsLayer] or {}).showParentalSpendControls
        };
    end)(v32);
end;
v32 = l_RoactServices_0.connect({
    appUpdateService = l_AppUpdateService_0
})((v5.connect(function(v60, _)
    return {
        formFactor = v60.FormFactor, 
        notificationCount = v60.NotificationBadgeCounts.MorePageSettings, 
        screenSize = v60.ScreenSize
    };
end, function(v62)
    return {
        setShowAgeVerificationOverlay = function(v63, v64, v65, v66)
            return v62(l_SetShowAgeVerificationOverlay_0(v63, v64, v65, v66));
        end, 
        setVoiceChatOptInStatus = function(v67)
            return v62(l_SetVoiceChatOptInStatus_0(v67));
        end
    };
end)(v32)));
if not l_GetFFlagTenFootMoreSettingsAndAboutRefactor_0() then
    return v32;
else
    return function(v68)
        local v69 = v20.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
        local v70 = v21();
        if not v69 then
            return v19.createElement(v32, v68);
        else
            return v19.createElement(v23, {
                itemList = v70
            });
        end;
    end;
end;
