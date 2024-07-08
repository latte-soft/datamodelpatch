local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Promise);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v12 = require(l_Modules_0.VoiceChat.Constants);
local v13 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v13.Core.Style.useStyle;
local l_StyledTextLabel_0 = v13.App.Text.StyledTextLabel;
local l_Images_0 = v13.App.ImageSet.Images;
local l_ImageSetLabel_0 = v13.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = v13.Utility.ExternalEventConnection;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v20 = require(l_Modules_0.Settings.Components.DropdownMenu);
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v22 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagUseFriendsPropsInMuteToggles);
local v23 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagRetryMutingNonFriends);
local v24 = l_Images_0["icons/controls/headphoneDeafen"];
local v25 = {
    PlayerJoined = "playerJoined", 
    PlayerLeft = "playerLeft", 
    PlayerFriended = "playerFriended", 
    PlayerUnfriended = "playerUnfriended"
};
local v26 = {
    Nobody = 1, 
    Everyone = 2
};
local v27 = {
    Nobody = 1, 
    NonFriends = 2, 
    Everyone = 3
};
local v28 = v8.wrap(v7.strictInterface({
    Players = v7.union(v7.instanceOf("Players"), v7.interface({
        GetPlayers = v7.callback, 
        GetFriendsAsync = v7.callback, 
        LocalPlayer = v7.union(v7.instanceOf("Player"), v7.interface({
            UserId = v7.number, 
            FriendStatusChanged = v7.RBXScriptSignal
        }))
    })), 
    initialTogglesState = v7.boolean, 
    playersFriends = v7.table
}));
return function(v29)
    assert(v28(v29));
    local l_Players_0 = v29.Players;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_initialTogglesState_0 = v29.initialTogglesState;
    local v33 = l_useLocalization_0({
        muteLabel = "Feature.SettingsHub.Label.Mute", 
        nobodyLabel = "Feature.SettingsHub.Action.NobodyToggle", 
        nonFriendsLabel = "Feature.SettingsHub.Action.NonfriendsToggle", 
        everyoneLabel = "Feature.SettingsHub.Action.EveryoneToggle"
    });
    local v34 = v33.muteLabel == "" and "Mute" or v33.muteLabel;
    local v35 = v33.nobodyLabel == "" and "Nobody" or v33.nobodyLabel;
    local v36 = v33.nonFriendsLabel == "" and "Non-friends" or v33.nonFriendsLabel;
    local v37 = v33.everyoneLabel == "" and "Everyone" or v33.everyoneLabel;
    local v38 = l_useStyle_0();
    local l_SubHeader1_0 = v38.Font.SubHeader1;
    local v40, v41 = v3.useState(not v22());
    local v42, v43 = v3.useState(false);
    local v44, v45 = v3.useState(false);
    local v46, v47 = v3.useState({});
    local v48, v49 = v3.useState(if l_initialTogglesState_0 then v26.Everyone else v26.Nobody);
    local v50, v51 = v3.useState({});
    local v52 = nil;
    local v53 = nil;
    if not v22() then
        local v54, v55 = v3.useState({
            v35, 
            v37
        });
        v52 = v54;
        v53 = v55;
    else
        local v56, v57 = v3.useState({
            v35, 
            v36, 
            v37
        });
        v52 = v56;
        v53 = v57;
    end;
    local v58 = v3.useCallback(function()
        l_default_0:MuteAll(true, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
    end);
    local v59 = v3.useCallback(function()
        l_default_0:MuteAll(false, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
    end);
    local v61 = v3.useCallback(function(v60)
        if not v5.isEmpty(v60) then
            l_default_0:ToggleMuteSome(v60, true, v12.VOICE_GROUP_TYPE.NONFRIENDS, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
        end;
        if v21 then
            l_default_0:FireMuteNonFriendsEvent();
        end;
    end);
    local v63 = v3.useCallback(function(v62)
        if not v5.isEmpty(v62) then
            l_default_0:ToggleMuteSome(v62, false, v12.VOICE_GROUP_TYPE.FRIENDS, v12.VOICE_CONTEXT_TYPE.MUTE_TOGGLES);
        end;
    end);
    local v70 = v3.useCallback(function(v64)
        v49(v64);
        if v64 == v27.Nobody then
            v59();
            return ;
        else
            if (not (v64 == v27.NonFriends) or v40) or v42 then
                v58();
            else
                local v65 = if not v22() then v50 else v29.playersFriends;
                local v66 = {};
                local v67 = {};
                for v68, v69 in pairs(v65) do
                    table.insert(if not v69 then v66 else v67, v68);
                end;
                v63(v67);
                v61(v66);
                if v23() then
                    task.delay(0.25, function()
                        l_default_0:EnsureCorrectMuteState(v66, true);
                        l_default_0:EnsureCorrectMuteState(v67, false);
                    end);
                    return ;
                end;
            end;
            return ;
        end;
    end);
    local v72 = v3.useCallback(function(v71)
        v49(if not v71 then v27.Nobody else if v40 or v42 then v26.Everyone else v27.Everyone);
    end);
    local v75 = v3.useCallback(function(v73, v74)
        if not v42 and v48 == v27.NonFriends then
            l_default_0:ToggleMuteSome({
                v73
            }, v74);
        end;
    end);
    local v78 = v3.useCallback(function(v76)
        if not v50[v76] then
            v51(function(v77)
                return v5.Dictionary.join(v77, {
                    [v76] = false
                });
            end);
            v75(v76, true);
        end;
    end);
    local v81 = v3.useCallback(function(v79)
        if not v50[v79] then
            v51(function(v80)
                return v5.Dictionary.join(v80, {
                    [v79] = v5.None
                });
            end);
        end;
    end);
    local v86 = v3.useCallback(function(v82, v83)
        if v83 == v25.PlayerFriended then
            if not v50[v82] then
                v51(function(v84)
                    return v5.Dictionary.join(v84, {
                        [v82] = true
                    });
                end);
            end;
            v75(v82, false);
            return ;
        else
            if v83 == v25.PlayerUnfriended then
                if v50[v82] then
                    v51(function(v85)
                        return v5.Dictionary.join(v85, {
                            [v82] = false
                        });
                    end);
                end;
                v75(v82, true);
            end;
            return ;
        end;
    end);
    local v90 = v3.useCallback(function(v87, v88)
        v47(function(v89)
            return v5.Dictionary.join(v89, {
                [#v89 + 1] = {
                    UserId = v87, 
                    Action = v88
                }
            });
        end);
    end);
    if not v22() then
        v3.useEffect(function()
            if not (v40 or v42) and (l_initialTogglesState_0 or v48 == v26.Everyone) then
                v49(v27.Everyone);
            end;
        end, {
            v40
        });
        v3.useEffect(function()
            local _ = function()
                return v6.new(function(v91, v92)
                    coroutine.wrap(function()
                        local l_status_0, l_result_0 = pcall(function()
                            if not l_LocalPlayer_0 then
                                return nil;
                            else
                                return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                            end;
                        end);
                        if l_status_0 then
                            local v95 = {};
                            if l_result_0 then
                                while true do
                                    for _, v97 in l_result_0:GetCurrentPage() do
                                        v95[v97.Id] = true;
                                    end;
                                    if l_result_0.IsFinished then
                                        break;
                                    elseif not pcall(function()
                                        l_result_0:AdvanceToNextPageAsync();
                                    end) then
                                        v92("Error loading friends");
                                        return ;
                                    end;
                                end;
                            end;
                            v91(v95);
                            return ;
                        else
                            v92("Error loading friends");
                            return ;
                        end;
                    end)();
                end);
            end;
            local function v99(v100)
                return v6.new(function(v101, v102)
                    coroutine.wrap(function()
                        local l_status_1, l_result_1 = pcall(function()
                            if not l_LocalPlayer_0 then
                                return nil;
                            else
                                return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                            end;
                        end);
                        if l_status_1 then
                            local v105 = {};
                            if l_result_1 then
                                while true do
                                    for _, v107 in l_result_1:GetCurrentPage() do
                                        v105[v107.Id] = true;
                                    end;
                                    if l_result_1.IsFinished then
                                        break;
                                    elseif not pcall(function()
                                        l_result_1:AdvanceToNextPageAsync();
                                    end) then
                                        v102("Error loading friends");
                                        return ;
                                    end;
                                end;
                            end;
                            v101(v105);
                            return ;
                        else
                            v102("Error loading friends");
                            return ;
                        end;
                    end)();
                end):catch(function()
                    if v100 > 0 then
                        return (v99(v100 - 1));
                    else
                        return (v6.reject());
                    end;
                end);
            end;
            local v115 = v6.new(function(v108, v109)
                coroutine.wrap(function()
                    local l_status_2, l_result_2 = pcall(function()
                        if not l_LocalPlayer_0 then
                            return nil;
                        else
                            return (l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId));
                        end;
                    end);
                    if l_status_2 then
                        local v112 = {};
                        if l_result_2 then
                            while true do
                                for _, v114 in l_result_2:GetCurrentPage() do
                                    v112[v114.Id] = true;
                                end;
                                if l_result_2.IsFinished then
                                    break;
                                elseif not pcall(function()
                                    l_result_2:AdvanceToNextPageAsync();
                                end) then
                                    v109("Error loading friends");
                                    return ;
                                end;
                            end;
                        end;
                        v108(v112);
                        return ;
                    else
                        v109("Error loading friends");
                        return ;
                    end;
                end)();
            end);
            local v116 = 3;
            v115:catch(function()
                if v116 > 0 then
                    return (v99(v116 - 1));
                else
                    return (v6.reject());
                end;
            end):andThen(function(v117)
                local v118 = {};
                for _, v120 in (l_Players_0:GetPlayers()), nil, nil do
                    if not ((not l_LocalPlayer_0 or not v120) or v117[v120.UserId]) then
                        v118[v120.UserId] = false;
                    end;
                end;
                v51((v5.Dictionary.join(v117, v118)));
                v41(false);
                v53({
                    v35, 
                    v36, 
                    v37
                });
            end):catch(function()
                v41(false);
                v43(true);
                v11:warning("MuteToggles: Failed to get list of friends from GetFriendsAsync");
            end);
        end, {});
        v3.useEffect(function()
            if not ((v40 or v44) or v5.isEmpty(v46)) then
                v45(true);
                local v121 = v46[1];
                if v121.Action == v25.PlayerJoined then
                    v78(v121.UserId);
                elseif v121.Action == v25.PlayerLeft then
                    v81(v121.UserId);
                else
                    v86(v121.UserId, v121.Action);
                end;
                v47(function(v122)
                    return v5.List.removeIndex(v122, 1);
                end);
                v45(false);
            end;
        end, {
            v44, 
            v46, 
            v40
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 1, 
        ZIndex = 3
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        MuteFrame = v4.createElement("Frame", {
            Size = UDim2.new(0.5, 0, 0, 40), 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = if not v38.UIBloxThemeEnabled then UDim.new(0, -1) else UDim.new(0, 4)
            }), 
            ImageSetLabel = v4.createElement(l_ImageSetLabel_0, {
                Image = v24, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 38, 0, 38), 
                LayoutOrder = 1
            }), 
            TextFrame = v4.createElement("Frame", {
                Size = UDim2.new(0.6, 0, 0, 40), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = if not v38.UIBloxThemeEnabled then UDim.new(0, 11) else UDim.new(0, 6)
                }), 
                TextLabel = v4.createElement(l_StyledTextLabel_0, {
                    text = v34, 
                    fontStyle = l_SubHeader1_0, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    colorStyle = {
                        Color = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    size = UDim2.new(1, 0, 0, 40)
                })
            })
        }), 
        DropdownMenu = v4.createElement(v20, {
            buttonSize = UDim2.new(0.5, 0, 0, 40), 
            dropdownList = v52, 
            selectedIndex = v48, 
            onSelection = v70, 
            layoutOrder = 2
        }), 
        MuteAllChangedEvent = if not l_default_0.muteAllChanged then nil else v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteAllChanged.Event, 
            callback = v72
        }), 
        PlayerJoinedVoiceEvent = v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.participantJoined.Event, 
            callback = function(_, v124)
                if not v22() then
                    v90(v124, v25.PlayerJoined);
                elseif not v29.playersFriends[v124] then
                    v75(v124, true);
                    return ;
                end;
            end
        }), 
        PlayerLeftVoiceEvent = if v22() then nil else v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.participantLeft.Event, 
            callback = function(_, v126)
                v90(v126, v25.PlayerLeft);
            end
        }), 
        FriendStatusChangeEvent = if not l_LocalPlayer_0 then nil else v4.createElement(l_ExternalEventConnection_0, {
            event = l_LocalPlayer_0.FriendStatusChanged, 
            callback = function(v127, v128)
                if v128 == Enum.FriendStatus.Friend then
                    if not v22() then
                        v90(v127.UserId, v25.PlayerFriended);
                        return ;
                    else
                        v75(v127.UserId, false);
                        return ;
                    end;
                elseif not v22() then
                    v90(v127.UserId, v25.PlayerUnfriended);
                    return ;
                else
                    v75(v127.UserId, true);
                    return ;
                end;
            end
        })
    });
end;
