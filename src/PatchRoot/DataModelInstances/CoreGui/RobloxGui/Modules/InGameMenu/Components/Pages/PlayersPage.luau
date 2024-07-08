local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_UIBlox_0 = v5.UIBlox;
local l_Cryo_0 = v5.Cryo;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Localization.withLocalization);
local v17 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v18 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatSpeakerIcons);
local v19 = require(script.Parent.Parent.Connection.FocusHandler);
local v20 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v22 = require(l_Parent_0.Components.PlayerLabelV2);
local v23 = require(l_Parent_0.Components.PlayerContextualMenu);
local v24 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v25 = require(l_Parent_0.Components.PageNavigationWatcher);
local v26 = require(l_Parent_0.Components.Divider);
local v27 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v28 = require(l_Parent_0.Components.Page);
local v29 = require(l_Parent_0.Thunks.CloseMenu);
local v30 = require(l_Parent_0.Resources.Assets);
local v31 = require(l_Parent_0.Resources.Constants);
local v32 = require(l_Parent_0.Utility.SendAnalytics);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v34 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v35 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.BlockPlayer);
local v36 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.UnblockPlayer);
local v37 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v38 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v39 = settings():GetFVariable("InGameGlobalGuiInset") + 24;
local v40 = l_Roact_0.PureComponent:extend("PlayersPage");
v40.validateProps = l_t_0.strictInterface({
    isMenuOpen = l_t_0.boolean, 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    inspectMenuEnabled = l_t_0.boolean, 
    friends = l_t_0.map(l_t_0.integer, l_t_0.enum(Enum.FriendStatus)), 
    closeMenu = l_t_0.callback, 
    blockPlayer = l_t_0.callback, 
    unblockPlayer = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    screenSize = l_t_0.Vector2, 
    currentPage = l_t_0.optional(l_t_0.string), 
    isRespawnDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isReportDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isGamepadLastInput = l_t_0.optional(l_t_0.boolean), 
    isCurrentZoneActive = l_t_0.optional(l_t_0.boolean)
});
v40.init = function(v41)
    v41:setState({
        players = l_Players_0:GetPlayers(), 
        selectedPlayer = nil, 
        selectedPlayerPosition = Vector2.new(0, 0), 
        pageSizeY = 0, 
        voiceChatEnabled = false, 
        allMuted = false, 
        selectedPlayerRef = nil, 
        firstPlayerRef = nil
    });
    v41.setSelectedPlayerRef = function(v42)
        if not v17() then
            v41:setState({
                selectedPlayerRef = v42, 
                firstPlayerRef = l_Roact_0.None
            });
            return ;
        else
            v41:setState({
                selectedPlayerRef = v42
            });
            return ;
        end;
    end;
    v41.setFirstPlayerRef = function(v43)
        v41:setState({
            firstPlayerRef = v43
        });
    end;
    if v24 then
        v41.positionChanged = function(v44)
            v41:setState({
                selectedPlayerPosition = v44.AbsolutePosition
            });
        end;
        v41.toggleMoreActions = function(v45)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v45);
            if v41.state.selectedPlayer == l_l_Players_0_PlayerByUserId_0 then
                v41:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return ;
            else
                v41:setState({
                    selectedPlayer = l_l_Players_0_PlayerByUserId_0
                });
                return ;
            end;
        end;
    end;
end;
local function v49(v47, v48)
    return v47.Name:lower() < v48.Name:lower();
end;
v40.renderListEntries = function(v50, v51)
    local v52 = l_Cryo_0.List.sort(v51, v49);
    local v53 = 0;
    local v54 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    for v55, v56 in pairs(v52) do
        local v57 = not not v24 and v56.UserId or v55;
        local v59 = not not v24 and v50.positionChanged or function(v58)
            v50:setState({
                selectedPlayerPosition = v58.AbsolutePosition
            });
        end;
        local v60 = not not v24 and v50.toggleMoreActions or function()
            if v50.state.selectedPlayer == v56 then
                v50:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return ;
            else
                v50:setState({
                    selectedPlayer = v56
                });
                return ;
            end;
        end;
        local v61 = nil;
        if not (v55 == 1) or v50.state.selectedPlayer then
            if v50.state.selectedPlayer == v56 then
                v61 = v50.setSelectedPlayerRef;
            end;
        else
            v61 = v50.setFirstPlayerRef;
        end;
        local v62 = "MicLight";
        if v18() then
            v62 = v56 ~= l_Players_0.LocalPlayer and "SpeakerLight" or "MicLight";
        end;
        local v63 = "player_" .. v57;
        local l_createElement_0 = l_Roact_0.createElement;
        local l_v22_0 = v22;
        local v66 = {
            username = v56.Name, 
            displayName = v56.DisplayName, 
            userId = v56.UserId, 
            isOnline = true, 
            isSelected = v50.state.selectedPlayer == v56, 
            LayoutOrder = v53, 
            onActivated = v60, 
            [l_Roact_0.Change.AbsolutePosition] = v50.state.selectedPlayer == v56 and v59 or nil, 
            [l_Roact_0.Ref] = v61
        };
        local v67 = {};
        local l_voiceEnabled_0 = v50.props.voiceEnabled;
        if l_voiceEnabled_0 then
            l_voiceEnabled_0 = false;
            if v56 ~= l_Players_0.LocalPlayer then
                l_voiceEnabled_0 = l_Roact_0.createElement(v20, {
                    userId = tostring(v56.UserId), 
                    hideOnError = true, 
                    iconStyle = v62, 
                    onClicked = v60
                });
            end;
        end;
        v67.Icon = l_voiceEnabled_0;
        v54[v63] = l_createElement_0(l_v22_0, v66, v67);
        v53 = v53 + 1;
        if v55 < #v52 then
            v54["divider_" .. v57] = l_Roact_0.createElement(v26, {
                LayoutOrder = v53, 
                Size = UDim2.new(1, -104, 0, 1)
            });
            v53 = v53 + 1;
        end;
    end;
    return v54;
end;
v40.getMoreActions = function(v69, v70)
    local v71 = {};
    if v69.state.selectedPlayer ~= nil then
        if v69.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            local l_Unknown_0 = Enum.FriendStatus.Unknown;
            if v69.props.friends[v69.state.selectedPlayer.UserId] then
                l_Unknown_0 = v69.props.friends[v69.state.selectedPlayer.UserId];
            end;
            local l_addFriend_0 = v70.addFriend;
            local v74 = l_Images_0["icons/actions/friends/friendAdd"];
            if l_Unknown_0 == Enum.FriendStatus.Friend then
                l_addFriend_0 = v70.unfriend;
                v74 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestSent then
                l_addFriend_0 = v70.cancelFriend;
                v74 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestReceived then
                l_addFriend_0 = v70.acceptFriend;
            end;
            do
                local l_l_Unknown_0_0 = l_Unknown_0;
                table.insert(v71, {
                    text = l_addFriend_0, 
                    icon = v74, 
                    onActivated = function()
                        local l_selectedPlayer_0 = v69.state.selectedPlayer;
                        if not (l_l_Unknown_0_0 ~= Enum.FriendStatus.Friend) or l_l_Unknown_0_0 == Enum.FriendStatus.FriendRequestSent then
                            l_Players_0.LocalPlayer:RevokeFriendship(l_selectedPlayer_0);
                        else
                            l_Players_0.LocalPlayer:RequestFriendship(l_selectedPlayer_0);
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            v32(v31.AnalyticsMenuActionName, v31.AnalyticsRequestFriendName, {});
                        end;
                        v69:setState({
                            selectedPlayer = l_Roact_0.None
                        });
                    end
                });
            end;
        end;
        table.insert(v71, {
            text = v70.viewAvatar, 
            icon = v30.Images.ViewAvatar, 
            onActivated = function()
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v69.state.selectedPlayer.UserId, "escapeMenu");
                v69:setState({
                    selectedPlayer = l_Roact_0.None
                });
                v69.props.closeMenu();
                v32(v31.AnalyticsMenuActionName, v31.AnalyticsExamineAvatarName, {});
            end
        });
        if v69.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            table.insert(v71, {
                text = v70.reportAbuse, 
                icon = l_Images_0["icons/actions/feedback"], 
                onActivated = function()
                    v37.openReportDialogForPlayer(v69.state.selectedPlayer, v31.AnalyticsMenuActionName);
                    v69:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
            if v69.props.voiceEnabled then
                local v77 = l_default_0.participants[tostring(v69.state.selectedPlayer.UserId)];
                if v77 then
                    local l_isMutedLocally_0 = v77.isMutedLocally;
                    table.insert(v71, {
                        text = not l_isMutedLocally_0 and "Mute Player" or "Unmute Player", 
                        icon = not not v18() and l_default_0:GetIcon(not l_isMutedLocally_0 and "Mute" or "Unmute", "Misc") or l_default_0:GetIcon(not l_isMutedLocally_0 and "Muted" or "Blank"), 
                        onActivated = function()
                            local l_selectedPlayer_1 = v69.state.selectedPlayer;
                            v38:debug("Muting Player {}", l_selectedPlayer_1.UserId);
                            l_default_0:ToggleMutePlayer(l_selectedPlayer_1.UserId, v21.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                            v69:setState({
                                selectedPlayer = l_Roact_0.None
                            });
                        end
                    });
                end;
            end;
            local l_selectedPlayer_2 = v69.state.selectedPlayer;
            local v81 = v34:IsPlayerBlockedByUserId(l_selectedPlayer_2.UserId);
            table.insert(v71, {
                text = not not v81 and v70.unblockPlayer or v70.blockPlayer, 
                icon = l_Images_0["icons/actions/block"], 
                onActivated = function()
                    if not v81 then
                        v69.props.blockPlayer(l_selectedPlayer_2);
                    else
                        v69.props.unblockPlayer(l_selectedPlayer_2);
                    end;
                    v69:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
        end;
    end;
    return v71;
end;
v40.renderFocusHandler = function(v82, v83)
    local v84 = nil;
    if v17() then
        local v85 = true;
        if v82.props.currentPage ~= v31.MainPagePageKey then
            v85 = not v82.props.isCurrentZoneActive;
        end;
        v84 = v85;
    end;
    local l_createElement_1 = l_Roact_0.createElement;
    local l_v19_0 = v19;
    local v88 = {};
    local l_v83_0 = v83;
    if l_v83_0 then
        l_v83_0 = false;
        if v82.props.currentPage == "Players" then
            l_v83_0 = ((v82.props.isMenuOpen and not v82.props.isReportDialogOpen) and not v82.state.selectedPlayer) and (v82.state.selectedPlayerRef or v82.state.firstPlayerRef) ~= nil;
        end;
    end;
    v88.isFocused = l_v83_0;
    v88.shouldForgetPreviousSelection = v84;
    v88.didFocus = not not v17() and function(v90)
        l_GuiService_0.SelectedCoreObject = v90 or v82.state.firstPlayerRef;
    end or function()
        l_GuiService_0.SelectedCoreObject = v82.state.selectedPlayerRef or v82.state.firstPlayerRef;
    end;
    return l_createElement_1(l_v19_0, v88);
end;
v40.renderWithLocalizedAndSelectionCursor = function(v91, v92, v93)
    local v94 = 0;
    local v95 = 0;
    local v96 = {};
    if v91.state.selectedPlayer ~= nil then
        v96 = v91:getMoreActions(v92);
        local v97 = #v96 * 56;
        local l_X_0 = v91.props.screenSize.X;
        local l_Y_0 = v91.props.screenSize.Y;
        v94 = if (v91.state.selectedPlayerPosition.Y + v97) + v39 < l_Y_0 then v91.state.selectedPlayerPosition.Y else (l_Y_0 - v97) - v39;
        v95 = if (((v91.state.selectedPlayerPosition.X + 400) + 20) + 352) + 24 <= l_X_0 then (v91.state.selectedPlayerPosition.X + 400) + 20 else (l_X_0 - 352) - 24;
    end;
    local v100 = nil;
    local v101 = (v91.props.isGamepadLastInput and not v91.props.isRespawnDialogOpen) and v91.props.isCurrentZoneActive;
    v100 = not not v91.state.selectedPlayer and l_Roact_0.createElement(v23, {
        moreActions = v96, 
        actionWidth = 352, 
        xOffset = v95, 
        yOffset = v94, 
        canCaptureFocus = v101, 
        onClose = function()
            v91:setState({
                selectedPlayer = l_Roact_0.None
            });
        end
    }) or nil;
    return l_Roact_0.createElement(v28, {
        pageTitle = v91.props.pageTitle, 
        titleChildren = v91.props.voiceEnabled and l_Roact_0.createElement("ImageButton", {
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            BorderSizePixel = 0, 
            Position = UDim2.new(1, 4, 0.5, 0), 
            Image = l_default_0:GetIcon(not v91.state.allMuted and "MuteAll" or "UnmuteAll", "Misc"), 
            [l_Roact_0.Event.Activated] = function()
                l_default_0:MuteAll(not v91.state.allMuted, v21.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v91:setState({
                    allMuted = not v91.state.allMuted
                });
            end, 
            SelectionImageObject = v93(l_CursorKind_0.RoundedRect)
        })
    }, {
        PlayerListContent = l_withStyle_0(function(_)
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                [l_Roact_0.Change.AbsoluteSize] = function(v103)
                    v91:setState({
                        pageSizeY = v103.AbsoluteSize.Y
                    });
                end
            }, {
                PlayerList = l_Roact_0.createElement(v27, {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    CanvasSize = UDim2.new(1, 0, 0, #v91.state.players * 72), 
                    ScrollingEnabled = v91.state.selectedPlayer == nil
                }, v91:renderListEntries(v91.state.players)), 
                MoreActionsMenu = v100
            });
        end), 
        FocusHandler = v91:renderFocusHandler(v101), 
        Watcher = l_Roact_0.createElement(v25, {
            desiredPage = "Players", 
            onNavigateTo = function()
                v91:setState({
                    players = l_Players_0:GetPlayers()
                });
            end, 
            onNavigateAway = function()
                v91:setState({
                    selectedPlayer = l_Roact_0.None
                });
            end
        })
    });
end;
v40.renderWithLocalized = function(v104, v105)
    return l_withSelectionCursorProvider_0(function(v106)
        return v104:renderWithLocalizedAndSelectionCursor(v105, v106);
    end);
end;
v40.render = function(v107)
    return v16({
        addFriend = "CoreScripts.InGameMenu.Actions.AddFriend", 
        acceptFriend = "CoreScripts.InGameMenu.Actions.AcceptFriend", 
        unfriend = "CoreScripts.InGameMenu.Actions.Unfriend", 
        cancelFriend = "CoreScripts.InGameMenu.Actions.CancelFriend", 
        viewAvatar = "CoreScripts.InGameMenu.Actions.ViewAvatar", 
        reportAbuse = "CoreScripts.InGameMenu.Actions.ReportAbuse", 
        blockPlayer = "CoreScripts.InGameMenu.Actions.BlockPlayer", 
        unblockPlayer = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
    })(function(v108)
        return v107:renderWithLocalized(v108);
    end);
end;
v40.didUpdate = function(v109, v110, _)
    if not (not v109.props.isMenuOpen or v110.isMenuOpen) then
        v109:setState({
            players = l_Players_0:GetPlayers(), 
            selectedPlayer = l_Roact_0.None
        });
    end;
    local l_selectedPlayerRef_0 = v109.state.selectedPlayerRef;
    if l_selectedPlayerRef_0 and v109.state.selectedPlayerPosition ~= l_selectedPlayerRef_0.AbsolutePosition then
        v109:setState({
            selectedPlayerPosition = l_selectedPlayerRef_0.AbsolutePosition
        });
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v113, _)
    return {
        isMenuOpen = v113.isMenuOpen, 
        voiceEnabled = v113.voiceState.voiceEnabled, 
        friends = v113.friends, 
        inspectMenuEnabled = v113.displayOptions.inspectMenuEnabled, 
        screenSize = v113.screenSize, 
        currentPage = v113.menuPage, 
        isRespawnDialogOpen = v113.respawn.dialogOpen, 
        isReportDialogOpen = v113.report.dialogOpen or v113.report.reportSentOpen, 
        isGamepadLastInput = v113.displayOptions.inputType == v31.InputType.Gamepad, 
        isCurrentZoneActive = v113.currentZone == 1
    };
end, function(v115)
    return {
        closeMenu = function()
            v115(v29);
        end, 
        blockPlayer = function(v116)
            return v115(v35(v116));
        end, 
        unblockPlayer = function(v117)
            return v115(v36(v117));
        end
    };
end)(v40);
