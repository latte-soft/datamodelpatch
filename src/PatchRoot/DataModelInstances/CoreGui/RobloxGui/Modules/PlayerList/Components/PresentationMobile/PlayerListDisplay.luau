local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v7.Style.withStyle;
local v10 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Interfaces.playerInterface);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local v12 = require(script.Parent.PlayerEntry);
local v13 = require(script.Parent.TeamEntry);
local v14 = require(script.Parent.TitleBar);
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Flags.FFlagPlayerListFixMobileScrolling);
local v17 = require(l_Parent_0.GetFakeNeutralTeam);
local v18 = v5.PureComponent:extend("PlayerListDisplay");
v18.validateProps = v8.strictInterface({
    isVisible = v8.boolean, 
    isMinimized = v8.boolean, 
    isTenFootInterface = v8.boolean, 
    isUsingGamepad = v8.boolean, 
    screenSizeY = v8.integer, 
    entrySize = v8.integer, 
    sortedPlayers = v8.array(v10), 
    sortedTeams = v8.optional(v8.any), 
    teamColorToPlayerMap = v8.optional(v8.map(v8.integer, v8.array(v10))), 
    teamScores = v8.optional(v8.map(v8.instanceIsA("Team"), v8.map(v8.string, v8.any))), 
    teamNames = v8.map(v8.instanceIsA("Team"), v8.string), 
    teamColors = v8.map(v8.instanceIsA("Team"), v8.BrickColor), 
    playerTeam = v8.map(v8.integer, v8.instanceIsA("Team")), 
    playerStats = v8.map(v8.integer, v8.map(v8.string, v8.any)), 
    gameStats = v8.array(v8.strictInterface({
        name = v8.string, 
        text = v8.string, 
        addId = v8.integer, 
        isPrimary = v8.boolean, 
        priority = v8.number
    })), 
    playerIconInfo = v8.map(v8.integer, v8.strictInterface({
        isPlaceOwner = v8.boolean, 
        avatarIcon = v8.optional(v8.table), 
        specialGroupIcon = v8.optional(v8.table)
    })), 
    playerRelationship = v8.map(v8.integer, v8.strictInterface({
        isBlocked = v8.boolean, 
        friendStatus = v8.enum(Enum.FriendStatus), 
        isFollowing = v8.boolean, 
        isFollower = v8.boolean
    })), 
    dropDownPlayer = v8.optional(v10), 
    dropDownVisible = v8.boolean
});
v18.init = function(v19)
    v19.scrollingFrameRef = v5.createRef();
    v19.firstPlayerRef = v5.createRef();
    v19.state = {
        lastCanvasPosition = Vector2.new(0, 0), 
        containerSizeY = 100, 
        contentsVisible = true
    };
    v19.absoluteSizeChanged = function(v20)
        v19:setState({
            containerSizeY = v20.AbsoluteSize.Y
        });
    end;
    v19.canvasPositionChanged = function(v21)
        v19:setState({
            lastCanvasPosition = v21.CanvasPosition
        });
    end;
end;
v18.getShowTitlePlayer = function(v22)
    local v23;
    if v22.props.sortedPlayers then
        v23 = true;
        if not (#v22.props.sortedPlayers <= 1) then
            goto label0;
        end;
    end;
    v23 = false;
    ::label0::;
    local v24;
    if v22.props.sortedTeams then
        v24 = true;
        if not (#v22.props.sortedTeams <= 0) then
            goto label1;
        end;
    end;
    v24 = false;
    ::label1::;
    return (v23 or v24) or #v22.props.gameStats > 0;
end;
v18.inVerticalScrollWindow = function(v25, v26, v27)
    if (v26 + v27) + v27 * 3 < v25.state.lastCanvasPosition.Y then
        return false;
    elseif v25.state.lastCanvasPosition.Y + v25.state.containerSizeY < v26 - v27 * 3 then
        return false;
    else
        return true;
    end;
end;
v18.isPastEndOfContent = function(v28, v29, v30)
    if v28.state.lastCanvasPosition.Y + v28.state.containerSizeY < v29 - v30 * 3 then
        return true;
    else
        return false;
    end;
end;
v18.render = function(v31)
    return l_WithLayoutValues_0(function(v32)
        return l_withStyle_0(function(_)
            local l_EntryPadding_0 = v32.EntryPadding;
            local l_TeamEntrySizeY_0 = v32.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v32.PlayerEntrySizeY;
            local v37 = 0;
            local function _()
                v37 = v37 + 1;
                return v37;
            end;
            local v39 = {};
            local v40 = 0;
            if v31:getShowTitlePlayer() then
                v39.TitlePlayer = v5.createElement(v12, {
                    player = l_LocalPlayer_0, 
                    playerStats = v31.props.playerStats[l_LocalPlayer_0.UserId] or {}, 
                    playerIconInfo = v31.props.playerIconInfo[l_LocalPlayer_0.UserId] or {
                        isPlaceOwner = false
                    }, 
                    playerRelationship = v31.props.playerRelationship[l_LocalPlayer_0.UserId] or {
                        isBlocked = false, 
                        friendStatus = Enum.FriendStatus.NotFriend, 
                        isFollowing = false, 
                        isFollower = false
                    }, 
                    titlePlayerEntry = true, 
                    gameStats = v31.props.gameStats, 
                    entrySize = v31.props.entrySize, 
                    topDiv = false, 
                    bottomDiv = true, 
                    Position = UDim2.fromOffset(0, v40)
                });
                v40 = v40 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
            end;
            v39.TitleBar = v5.createElement(v14, {
                contentsVisible = v31.state.contentsVisible, 
                gameStats = v31.props.gameStats, 
                Size = UDim2.new(1, 0, 0, 24), 
                entrySize = v31.props.entrySize, 
                Position = UDim2.fromOffset(0, v40)
            });
            v40 = v40 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
            local l_v40_0 = v40;
            if not v31.props.sortedTeams then
                l_v40_0 = l_v40_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v31.props.sortedPlayers;
                for v42, v43 in ipairs(v31.props.sortedPlayers) do
                    if not (v42 ~= 1 and v31:isPastEndOfContent(v40, l_PlayerEntrySizeY_0)) then
                        if not (v42 ~= 1 and not v31:inVerticalScrollWindow(v40, l_PlayerEntrySizeY_0)) then
                            local l_UserId_0 = v43.UserId;
                            local v45 = "Player_" .. tostring(l_UserId_0);
                            local l_createElement_0 = v5.createElement;
                            local l_v12_0 = v12;
                            local v48 = {
                                player = v43, 
                                playerStats = v31.props.playerStats[l_UserId_0], 
                                playerIconInfo = v31.props.playerIconInfo[l_UserId_0], 
                                playerRelationship = v31.props.playerRelationship[l_UserId_0], 
                                titlePlayerEntry = false, 
                                gameStats = v31.props.gameStats, 
                                entrySize = v31.props.entrySize
                            };
                            v37 = v37 + 1;
                            v48.layoutOrder = v37;
                            v48.topDiv = true;
                            v48.bottomDiv = false;
                            v48.Position = UDim2.fromOffset(0, v40);
                            v48[v5.Ref] = v42 == 1 and v31.firstPlayerRef or nil;
                            v39[v45] = l_createElement_0(l_v12_0, v48);
                        end;
                        v40 = v40 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                    else
                        break;
                    end;
                end;
            else
                local v49 = true;
                for v50, v51 in ipairs(v31.props.sortedTeams) do
                    local v52 = nil;
                    if v51.team == v17 then
                        v52 = {};
                        for _, v54 in ipairs(v31.props.sortedPlayers) do
                            if v31.props.playerTeam[v54.UserId] == nil then
                                table.insert(v52, v54);
                            end;
                        end;
                    else
                        v52 = v31.props.teamColorToPlayerMap[v51.team.TeamColor.Number] or {};
                    end;
                    l_v40_0 = l_v40_0 + (l_TeamEntrySizeY_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v52);
                    if v31:inVerticalScrollWindow(v40, l_TeamEntrySizeY_0) then
                        local v55 = "Team_" .. tostring(v50);
                        local l_createElement_1 = v5.createElement;
                        local l_v13_0 = v13;
                        local v58 = {
                            teamName = v31.props.teamNames[v51.team], 
                            teamColor = v31.props.teamColors[v51.team], 
                            leaderstats = v31.props.teamScores[v51.team], 
                            gameStats = v31.props.gameStats, 
                            entrySize = v31.props.entrySize
                        };
                        v37 = v37 + 1;
                        v58.layoutOrder = v37;
                        v58.Position = UDim2.fromOffset(0, v40);
                        v39[v55] = l_createElement_1(l_v13_0, v58);
                    end;
                    v40 = v40 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
                    for v59, v60 in ipairs(v52) do
                        if not (not v49 and v31:isPastEndOfContent(v40, l_TeamEntrySizeY_0)) then
                            if not (not v49 and not v31:inVerticalScrollWindow(v40, l_PlayerEntrySizeY_0)) then
                                local l_UserId_1 = v60.UserId;
                                v39["Player_" .. tostring(v60.UserId)] = v5.createElement(v12, {
                                    player = v60, 
                                    playerStats = v31.props.playerStats[l_UserId_1], 
                                    playerIconInfo = v31.props.playerIconInfo[l_UserId_1], 
                                    playerRelationship = v31.props.playerRelationship[l_UserId_1], 
                                    titlePlayerEntry = false, 
                                    gameStats = v31.props.gameStats, 
                                    topDiv = true, 
                                    bottomDiv = v59 == #v52, 
                                    entrySize = v31.props.entrySize, 
                                    Position = UDim2.fromOffset(0, v40), 
                                    [v5.Ref] = not not v49 and v31.firstPlayerRef or nil
                                });
                                v49 = false;
                            end;
                            v40 = v40 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                        else
                            break;
                        end;
                    end;
                end;
            end;
            local l_huge_0 = math.huge;
            if #v31.props.gameStats > 0 then
                l_huge_0 = l_huge_0 - v32.TitleBarSizeY;
            end;
            local v63 = true;
            if not v16 then
                v63 = not v31.props.dropDownVisible;
            end;
            return v5.createElement("ScrollingFrame", {
                Active = v16, 
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.fromOffset(0, l_v40_0), 
                BackgroundTransparency = 1, 
                ScrollBarImageColor3 = v32.ScrollImageColor, 
                ScrollBarImageTransparency = v32.ScrollImageTransparency, 
                BorderSizePixel = 0, 
                ScrollBarThickness = v32.ScrollBarSizeMobile, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
                ClipsDescendants = true, 
                ScrollingEnabled = v63, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                Selectable = false, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v5.Change.CanvasPosition] = v31.canvasPositionChanged, 
                [v5.Change.AbsoluteSize] = v31.absoluteSizeChanged
            }, v39);
        end);
    end);
end;
v18.didUpdate = function(v64, v65)
    if v64.props.isVisible ~= v65.isVisible then
        if not v64.props.isVisible then
            if not (not v64.props.isTenFootInterface or not v64.props.isUsingGamepad) then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if not (not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v64.scrollingFrameRef.current)) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        elseif not (not v64.props.isTenFootInterface or not v64.props.isUsingGamepad) then
            l_GuiService_0.SelectedCoreObject = v64.firstPlayerRef.current;
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        end;
    end;
    if v64.props.isMinimized ~= v65.isMinimized then
        v64:setState({
            contentsVisible = not v64.props.isMinimized
        });
    end;
end;
return v6.connect(function(v66)
    return {
        isVisible = v66.displayOptions.isVisible, 
        isMinimized = v66.displayOptions.isMinimized, 
        isTenFootInterface = v66.displayOptions.isTenFootInterface, 
        isUsingGamepad = v66.displayOptions.isUsingGamepad, 
        gameStats = v66.gameStats, 
        teamNames = v66.teamNames, 
        teamColors = v66.teamColors, 
        playerStats = v66.playerStats, 
        playerIconInfo = v66.playerIconInfo, 
        playerRelationship = v66.playerRelationship, 
        playerTeam = v66.playerTeam, 
        dropDownPlayer = v66.playerDropDown.selectedPlayer, 
        dropDownVisible = v66.playerDropDown.isVisible
    };
end, nil)(v18);
