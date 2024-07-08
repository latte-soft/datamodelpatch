local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_sortFriendsByCorrectedPresenceAndRank_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v12 = require(l_Modules_0.Settings.Theme);
local v13 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v15 = require(l_ShareGame_0.Components.ConversationEntry);
local v16 = require(l_ShareGame_0.Components.InviteListEntry);
local v17 = require(l_ShareGame_0.Components.FriendsErrorPage);
local v18 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceId);
local v19 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceIdCustomized);
local v20 = require(l_ShareGame_0.NewInviteMenuExperimentManager);
local v21 = require(l_ShareGame_0.Components.LoadingFriendsPage);
local v22 = require(l_ShareGame_0.Components.NoFriendsPage);
local v23 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate);
local v24 = require(l_Modules_0.Settings.Flags.GetFFlagShareInviteLinkContextMenuV1Enabled);
local v25 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v26 = require(l_Modules_0.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v27 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v28 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v30 = require(l_Modules_0.Common.httpRequest);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v34 = require(l_ShareGame_0.getTranslator)();
local v35 = not v12.UIBloxThemeEnabled and 18 or 16;
local v36 = v12.font(Enum.Font.SourceSans);
local l_GRAY3_0 = v13.Color.GRAY3;
local v38 = v12.textSize(19);
local v39 = {
    [l_UserModel_0.PresenceType.ONLINE] = 3, 
    [l_UserModel_0.PresenceType.IN_GAME] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
local v40 = {
    SORT_BY_FREQUENCY = 1, 
    SORT_BY_PRESENCE_AND_FREQUENCY = 2
};
local v41 = v8.PureComponent:extend("ConversationList");
v41.defaultProps = {
    entryHeight = 62, 
    entryPadding = v35
};
v41.init = function(v42)
    v42.scrollingRef = v8.createRef();
    v42.inviteUser = function(v43)
        return v42.props.inviteUser(v43, v42.props.analytics, v42.props.trigger, v42.props.inviteMessageId, v42.props.launchData);
    end;
end;
v41.render = function(v44)
    local l_analytics_0 = v44.props.analytics;
    local v46 = v44.props[v8.Children] or {};
    local l_entryHeight_0 = v44.props.entryHeight;
    local l_entryPadding_0 = v44.props.entryPadding;
    local l_friends_0 = v44.props.friends;
    local l_friendsRetrievalStatus_0 = v44.props.friendsRetrievalStatus;
    local l_layoutOrder_0 = v44.props.layoutOrder;
    local l_size_0 = v44.props.size;
    local l_zIndex_0 = v44.props.zIndex;
    local l_topPadding_0 = v44.props.topPadding;
    local l_invites_0 = v44.props.invites;
    local l_inviteUser_0 = v44.props.inviteUser;
    local l_searchText_0 = v44.props.searchText;
    if v28() then
        l_inviteUser_0 = v44.inviteUser;
    end;
    local v58 = v27();
    v46.RowListLayout = v8.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_entryPadding_0)
    });
    local v59 = 0;
    for v60, v61 in ipairs(l_friends_0) do
        local v62 = v23(l_searchText_0, v61.name, v61.displayName);
        if not v58 then
            v46["User-" .. tostring(v60)] = v8.createElement(v15, {
                analytics = l_analytics_0, 
                visible = v62, 
                size = UDim2.new(1, 0, 0, l_entryHeight_0), 
                layoutOrder = v60, 
                zIndex = l_zIndex_0, 
                title = v61.displayName, 
                subtitle = "@" .. v61.name, 
                presence = v61.presence, 
                users = {
                    v61
                }, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v61.id]
            });
        else
            v46["User-" .. tostring(v60)] = v8.createElement(v16, {
                analytics = l_analytics_0, 
                user = v61, 
                visible = v62, 
                layoutOrder = v60, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v61.id], 
                isFullRowActivatable = l_UserInputService_0.GamepadEnabled, 
                trigger = v44.props.trigger, 
                inviteMessageId = v44.props.inviteMessageId, 
                launchData = v44.props.launchData
            });
        end;
        if v62 then
            v59 = v59 + 1;
        end;
    end;
    if not (#l_friends_0 ~= 0) or l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Fetching then
        local l_v21_0 = v21;
        if l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Done then
            l_v21_0 = v22;
        elseif l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Failed then
            l_v21_0 = v17;
        end;
        return v8.createElement(l_v21_0, {
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0), 
            ZIndex = l_zIndex_0
        });
    elseif v59 == 0 then
        return v8.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Font = v36, 
            Size = UDim2.new(1, 0, 0, l_entryHeight_0), 
            Text = v34:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"), 
            TextColor3 = l_GRAY3_0, 
            TextSize = v38, 
            TextTransparency = 0.22, 
            ZIndex = l_zIndex_0, 
            Position = if not v24() then nil else UDim2.new(0, 0, 0, l_topPadding_0)
        });
    else
        return v8.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            BorderSizePixel = if not v26() then nil else 0, 
            Position = not not v24() and UDim2.new(0, 0, 0, l_topPadding_0) or nil, 
            CanvasSize = if not v58 then UDim2.new(0, 0, 0, v59 * (l_entryHeight_0 + l_entryPadding_0)) else UDim2.new(), 
            AutomaticCanvasSize = if not v58 then nil else Enum.AutomaticSize.Y, 
            ScrollBarThickness = 0, 
            ZIndex = l_zIndex_0, 
            Selectable = false, 
            [v8.Ref] = v44.scrollingRef
        }, v46);
    end;
end;
local function v68(v64)
    if not v27() or l_UserInputService_0.GamepadEnabled then
        local v65 = v64.scrollingRef:getValue();
        if not (not v65 or not v65:FindFirstAncestorOfClass("ScreenGui").Enabled) and l_GuiService_0.SelectedCoreObject == nil then
            l_GuiService_0:AddSelectionParent("invitePrompt", v65);
            for _, v67 in ipairs(v65:GetChildren()) do
                if v67:IsA("GuiObject") and v67.LayoutOrder == 1 then
                    l_GuiService_0.SelectedCoreObject = v67;
                    return ;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v41.didUpdate = v68;
if not v28() then
    v41.didMount = v68;
else
    v41.didMount = function(v69)
        if v69.props.analytics and v69.props.trigger == v13.Triggers.GameMenu then
            local v70 = false;
            if v69.props.launchData ~= nil then
                v70 = v69.props.launchData ~= "";
            end;
            v69.props.analytics:sendEvent(v69.props.trigger, l_GameInviteEvents_0.ModalOpened, if not v25() then nil else {
                isLaunchDataProvided = v70
            });
        end;
        v68(v69);
    end;
end;
local v80 = l_memoize_0(function(v71)
    local v72 = {};
    local function v77(v73, v74)
        local v75 = v39[v73.presence];
        local v76 = v39[v74.presence];
        if v75 == v76 then
            return v73.name:lower() < v74.name:lower();
        else
            return v76 < v75;
        end;
    end;
    for _, v79 in pairs(v71) do
        if v79.isFriend then
            v72[#v72 + 1] = v79;
        end;
    end;
    table.sort(v72, v77);
    return v72;
end);
local v85 = l_memoize_0(function(v81)
    local v82 = {};
    for _, v84 in pairs(v81) do
        if v84.isFriend then
            v82[#v82 + 1] = v84;
        end;
    end;
    table.sort(v82, l_sortFriendsByCorrectedPresenceAndRank_0);
    return v82;
end);
local v95 = l_memoize_0(function(v86)
    local v87 = {};
    local function v92(v88, v89)
        local v90 = tonumber(v88.friendFrequentRank) or 0;
        local v91 = tonumber(v89.friendFrequentRank) or 0;
        if v90 == v91 then
            return v88.name:lower() < v89.name:lower();
        else
            return v90 < v91;
        end;
    end;
    for _, v94 in pairs(v86) do
        if v94.isFriend then
            v87[#v87 + 1] = v94;
        end;
    end;
    table.sort(v87, v92);
    return v87;
end);
local function _()
    local v96 = v20.default:getInviteListSortOrder() or 0;
    if v96 == v40.SORT_BY_FREQUENCY then
        return v95;
    elseif v96 == v40.SORT_BY_PRESENCE_AND_FREQUENCY then
        return v85;
    else
        return v80;
    end;
end;
return v9.UNSTABLE_connect2(function(v98, _)
    local l_v80_0 = v80;
    if l_GetFFlagInviteListRerank_0() then
        local v101 = v20.default:getInviteListSortOrder() or 0;
        l_v80_0 = if v101 == v40.SORT_BY_FREQUENCY then v95 else if v101 == v40.SORT_BY_PRESENCE_AND_FREQUENCY then v85 else v80;
    end;
    return {
        friends = l_v80_0(v98.Users), 
        friendsRetrievalStatus = v98.Friends.retrievalStatus[tostring(l_Players_0.LocalPlayer.UserId)], 
        invites = v98.Invites
    };
end, function(v102)
    return {
        inviteUser = function(v103, v104, v105, v106, v107)
            local v108 = v30(l_HttpRbxApiService_0);
            local v109 = tostring(game.PlaceId);
            if not v28() then
                return v102(v18(v108, v103, v109));
            else
                return v102(v19(v108, v103, v109, v104, v105, v106, v107));
            end;
        end
    };
end)(v41);
