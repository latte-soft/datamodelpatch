local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_TextService_0 = game:GetService("TextService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local v6 = require(l_Parent_0.FriendsMenu);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Parent_0.UniversalAppPolicy);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_FriendsMenuSearch_0 = v6.FriendsMenuSearch;
local l_FriendsListContext_0 = v6.FriendsListContext;
local l_InviteFriendContext_0 = v6.InviteFriendContext;
local v15 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v16 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v17 = require(l_Components_0.ShareGameInviteLink);
local v18 = require(l_utils_0.isExperienceOlderThanOneWeek);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v21 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v22 = require(l_Context_0.GameInviteModalLayoutContext);
local v23 = require(l_Context_0.GameDetailsContext);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_Images_0 = v8.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_useAppPolicy_0 = v9.useAppPolicy;
local v29 = require(l_Parent_0.SharedFlags);
local l_FFlagGameInviteModalInviteLinkPolicy_0 = v29.FFlagGameInviteModalInviteLinkPolicy;
local l_GetFFlagEnableGameInviteModalVRSupport_0 = v29.GetFFlagEnableGameInviteModalVRSupport;
local l_TitleIconSize_0 = v21.Layout.TitleIconSize;
local l_SidePadding_0 = v21.Layout.SidePadding;
local v34 = l_Images_0["icons/navigation/close"];
local v35 = l_Images_0["icons/menu/search"];
local v36 = {
    cancelText = "Feature.SettingsHub.Action.CancelSearch", 
    invitefriends = "Feature.SettingsHub.Heading.InviteFriends", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
local function v44(v38, v39, v40)
    if not l_GetFFlagEnableGameInviteModalVRSupport_0() then
        if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            local v41 = not v39;
            if v41 then
                if l_FFlagGameInviteModalInviteLinkPolicy_0 then
                    v41 = v40;
                    if not v41 then
                        goto label0;
                    end;
                end;
                v41 = false;
                if v38.serverType == "StandardServer" then
                    v41 = v18(v38.gameDetails);
                end;
            end;
            ::label0::;
            return v41;
        else
            local v42 = not v39;
            if v42 then
                if l_FFlagGameInviteModalInviteLinkPolicy_0 then
                    v42 = v40;
                    if not v42 then
                        goto label1;
                    end;
                end;
                v42 = v38;
                if v42 then
                    v42 = v38.isCoreScript;
                    if v42 then
                        v42 = false;
                        if v38.serverType == "StandardServer" then
                            v42 = v18(v38.gameDetails);
                        end;
                    end;
                end;
            end;
            ::label1::;
            return v42;
        end;
    else
        local v43 = not l_IsVRAppBuild_0();
        if v43 then
            if l_FFlagGameInviteModalInviteLinkPolicy_0 then
                v43 = v40;
                if not v43 then
                    goto label2;
                end;
            end;
            v43 = not v39;
            if v43 then
                v43 = v38;
                if v43 then
                    v43 = v38.isCoreScript;
                    if v43 then
                        v43 = false;
                        if v38.serverType == "StandardServer" then
                            v43 = v18(v38.gameDetails);
                        end;
                    end;
                end;
            end;
        end;
        ::label2::;
        return v43;
    end;
end;
return function(v45)
    local v46 = l_useStyle_0();
    local v47 = v7.useContext(v22);
    local v48 = v7.useContext(v23);
    local v49 = v7.useContext(l_FriendsListContext_0);
    local v50 = v7.useContext(l_InviteFriendContext_0);
    local v51, v52 = v7.useState(false);
    local v53 = l_getLocalizedStrings_0(v36);
    local l_searchFriends_0 = v49.searchFriends;
    local v55 = false;
    if l_FFlagGameInviteModalInviteLinkPolicy_0 then
        v55 = l_useAppPolicy_0(function(v56)
            return v56.getExperienceInviteShareLinkEnabled();
        end);
    end;
    local v57 = v47.modalMode == "compact";
    local l_isFullWidth_0 = v47.isFullWidth;
    local v59 = l_DeviceInfo_0.isDesktopDevice();
    local v60 = v44(v48, l_DeviceInfo_0.isConsole(), v55);
    local v61 = v59 and not l_isFullWidth_0;
    local v62 = v46.Font.BaseSize * v46.Font.Header2.RelativeSize;
    local v63 = v46.Font.BaseSize * v46.Font.Body.RelativeSize;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v53.copyLink, v62, v46.Font.Header2.Font, Vector2.new(300 - l_TitleIconSize_0, math.huge));
    local v65 = nil;
    local v66 = 0;
    if v60 then
        if not v59 or not v61 then
            v65 = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0);
            v66 = v66 + l_TitleIconSize_0;
        else
            local v67 = math.ceil(l_l_TextService_0_TextSize_0.X) + 10;
            v65 = UDim2.new(0, v67, 1, 0);
            v66 = v66 + v67;
        end;
    end;
    if v57 then
        v66 = v66 + l_TitleIconSize_0;
    end;
    if not (not v57 or not v60) then
        v66 = v66 + 4;
    end;
    local function v68()
        v16:closeModal(v50.getMaxRecipientRowNum());
    end;
    local function v69()
        v52(true);
    end;
    local function v70()
        v52(false);
        l_searchFriends_0("");
    end;
    if not (v57 or not v51) then
        v52(false);
        l_searchFriends_0("");
    end;
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        LayoutOrder = v45.layoutOrder, 
        Position = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then UDim2.new(0, 0, 0, 4) else UDim2.new(0, 0, 1, 0), 
        Size = v45.size
    }, if not v51 then v7.useMemo(function()
        return {
            UIPadding = v7.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LeftActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v66, 1, 0), 
                LayoutOrder = 0, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 4)
                }), 
                CloseButton = v7.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v68, 
                    Image = v34, 
                    ImageColor3 = v46.Theme.IconEmphasis.Color, 
                    ImageTransparency = v46.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v53.invitefriends, 
                TextSize = v62, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = v46.Theme.TextEmphasis.Color, 
                Font = v46.Font.Header2.Font, 
                Size = UDim2.new(1, -1 * (2 * v66), 1, 0), 
                LayoutOrder = 1
            }), 
            RightActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v66, 1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Padding = UDim.new(0, 4)
                }), 
                SearchButton = not not v57 and v7.createElement(l_ImageSetButton_0, {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v69, 
                    Image = v35, 
                    ImageColor3 = v46.Theme.IconEmphasis.Color, 
                    ImageTransparency = v46.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                }) or nil, 
                ShareGameInviteLink = not not v60 and v7.createElement(v17, {
                    layoutOrder = 1, 
                    isDesktop = v59, 
                    isFullSize = v61, 
                    size = v65
                }) or nil
            })
        };
    end, {
        v51, 
        v61, 
        v57, 
        v60, 
        v59
    }) else v7.useMemo(function()
        return {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Padding = UDim.new(0, 4)
            }), 
            SearchBox = v7.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 0, 
                size = UDim2.new(1, -120, 1, -20), 
                focusElement = true, 
                onFocus = function()
                    v15:onSearchFocused();
                end
            }), 
            CancelButton = v7.createElement("TextButton", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, 100, 1, 0), 
                TextSize = v63, 
                TextColor3 = v46.Theme.UIDefault.Color, 
                Text = v53.cancelText, 
                Font = v46.Font.Body.Font, 
                [v7.Event.Activated] = v70
            })
        };
    end, {
        v51
    }));
end;
