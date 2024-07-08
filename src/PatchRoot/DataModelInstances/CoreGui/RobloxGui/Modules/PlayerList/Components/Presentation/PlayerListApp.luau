local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Otter);
local v7 = require(l_RobloxGui_0.Modules.Stats.StatsUtils);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v10 = require(l_Parent_0.PlayerListSorter);
local v11 = require(l_Parent_0.PlayerEntry);
local v12 = require(l_Parent_0.Parent.PresentationCommon.VoiceChatShield);
local v13 = require(l_Parent_0.Parent.PresentationCommon.TenFootSideBar);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v15 = require(l_Connection_0.EventConnections);
local v16 = require(l_Connection_0.ContextActionsBinder);
local v17 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v19 = require(l_RobloxGui_0.Modules.Flags.FFlagMobilePlayerList);
local v20 = {
    dampingRatio = 1, 
    frequency = 7
};
local v21 = v4.PureComponent:extend("PlayerListApp");
local _ = function(v22)
    for _, v24 in ipairs(v22) do
        if v24.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v35(v26, v27)
    local v28 = {};
    local v29 = 0;
    for _, v31 in pairs(v26) do
        if not v28[v31.TeamColor.Number] then
            v28[v31.TeamColor.Number] = true;
            v29 = v29 + 1;
        end;
    end;
    if v29 > 0 then
        local v32;
        for _, v34 in ipairs(v27) do
            if v34.Team == nil then
                v32 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v32 = false;
        ::label0::;
        if v32 then
            v29 = v29 + 1;
        end;
    end;
    return v29;
end;
v21.init = function(v36)
    v36.state = {
        visible = true
    };
    local v37, v38 = v4.createBinding(UDim2.new(0, 0, 0, 0));
    v36.positionOffset = v37;
    v36.updatePositionOffset = v38;
    v36.positionMotor = v6.createSingleMotor(0);
    v36.positionMotor:onStep(function(v39)
        v36.updatePositionOffset(UDim2.new(v39, 0, 0, 0));
    end);
    v36.positionMotor:onComplete(function(_)
        if not v36.props.displayOptions.isVisible then
            v36:setState({
                visible = false
            });
        end;
    end);
end;
v21.render = function(v41)
    return l_WithLayoutValues_0(function(v42)
        local l_ContainerPosition_0 = v42.ContainerPosition;
        local l_ContainerSize_0 = v42.ContainerSize;
        local l_AnchorPoint_0 = v42.AnchorPoint;
        if not (v42.IsTenFoot or not v41.props.displayOptions.performanceStatsVisible) then
            l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v7.ButtonHeight);
        end;
        if v19 then
            l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v42.TopBarOffset);
        end;
        local l_MaxLeaderstats_0 = v42.MaxLeaderstats;
        if v41.props.displayOptions.isSmallTouchDevice then
            l_MaxLeaderstats_0 = v42.MaxLeaderstatsSmallScreen;
        end;
        local v47 = math.min(#v41.props.gameStats, l_MaxLeaderstats_0);
        if v47 > 0 then
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, (v42.StatEntrySizeX + v42.EntryPadding) * v47, 0, 0);
        end;
        local v48 = nil;
        if not v42.IsTenFoot then
            v48 = v42.EntryBaseSizeX + math.min(4, v47) * v42.EntrySizeIncreasePerStat;
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v42.ExtraContainerPadding, 0, 0);
            local v49 = (l_ContainerSize_0.X.Offset + v42.ContainerPadding * 2) + (v42.PlayerDropDownSizeX + v42.PlayerDropDownOffset);
            if v41.props.screenSizeX - v49 < v48 then
                v48 = v41.props.screenSizeX - v49;
            end;
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v48, 0, 0);
        else
            v48 = v42.EntrySizeX;
        end;
        local l_huge_0 = math.huge;
        local v51 = false;
        if l_Players_0.MaxPlayers >= 6 then
            v51 = l_Players_0.MaxPlayers <= 12;
        end;
        if v51 then
            l_huge_0 = l_Players_0.MaxPlayers * 26 + v35(v41.props.teams, v41.props.players) * 20;
        end;
        local v52 = {};
        if v42.IsTenFoot then
            for _, v54 in ipairs(v41.props.players) do
                if v54 == l_Players_0.LocalPlayer then
                    v52.TitlePlayerEntry = v4.createElement("Frame", {
                        Position = UDim2.fromOffset(0, 0), 
                        Size = UDim2.new(1, v42.EntryXOffset, 0, v42.PlayerEntrySizeY), 
                        BackgroundTransparency = 1
                    }, {
                        PlayerEntry = v4.createElement(v11, {
                            player = v54, 
                            playerStats = v41.props.playerStats[v54.UserId], 
                            playerIconInfo = v41.props.playerIconInfo[v54.UserId], 
                            playerRelationship = v41.props.playerRelationship[v54.UserId], 
                            titlePlayerEntry = true, 
                            hasDivider = false, 
                            gameStats = v41.props.gameStats, 
                            entrySize = v48
                        })
                    });
                    break;
                end;
            end;
        end;
        v52.PlayerScrollList = v4.createElement(v10, {
            screenSizeY = v41.props.screenSizeY, 
            entrySize = v48
        });
        v52.EventConnections = v4.createElement(v15);
        v52.ContextActionsBindings = v4.createElement(v16);
        v52.TopStatConnector = v4.createElement(v17);
        if not (game:GetEngineFeature("XboxRemoveVoiceChatButton") or not v41.props.displayOptions.hasPermissionToVoiceChat) then
            v52.VoiceChatShield = v4.createElement(v12);
        end;
        if v41.props.displayOptions.isTenFootInterface then
            v52.TenFootSideBar = v4.createElement(v13);
        end;
        return v4.createElement("Frame", {
            Position = l_ContainerPosition_0, 
            AnchorPoint = l_AnchorPoint_0, 
            Size = l_ContainerSize_0, 
            BackgroundTransparency = 1, 
            Visible = v41.state.visible, 
            ZIndex = not v42.IsTenFoot and 1 or 2, 
            AutoLocalize = false, 
            [v4.Ref] = v41.rootRef
        }, {
            OffsetFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v41.positionOffset, 
                BackgroundTransparency = 1
            }, v52), 
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 0), 
                MaxSize = Vector2.new(math.huge, l_huge_0)
            }) or nil
        });
    end);
end;
v21.didMount = function(v55)
    v55:setState({
        visible = v55.props.displayOptions.isVisible
    });
end;
v21.didUpdate = function(v56, v57, _)
    if v56.props.displayOptions.isVisible ~= v57.displayOptions.isVisible then
        if not v56.props.displayOptions.isTenFootInterface then
            if not v56.props.displayOptions.isVisible then
                v56.positionMotor:setGoal(v6.spring(1.1, v20));
            else
                v56:setState({
                    visible = true
                });
                v56.positionMotor:setGoal(v6.instant(0.2));
                v56.positionMotor:step(0);
                v56.positionMotor:setGoal(v6.spring(0, v20));
                return ;
            end;
        else
            v56:setState({
                visible = v56.props.displayOptions.isVisible
            });
            return ;
        end;
    end;
end;
v21.willUnmount = function(v59)
    v59.positionMotor:destroy();
    v59.positionMotor = nil;
end;
return v5.UNSTABLE_connect2(function(v60)
    return {
        screenSizeX = v60.screenSize.X, 
        screenSizeY = v60.screenSize.Y, 
        displayOptions = v60.displayOptions, 
        players = v60.players, 
        playerStats = v60.playerStats, 
        playerIconInfo = v60.playerIconInfo, 
        playerRelationship = v60.playerRelationship, 
        gameStats = v60.gameStats, 
        teams = v60.teams
    };
end, nil)(v21);
