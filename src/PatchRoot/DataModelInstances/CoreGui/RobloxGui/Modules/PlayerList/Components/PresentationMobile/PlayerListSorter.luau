local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent;
local v8 = require(l_Parent_0.PlayerListDisplay);
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v10 = require(l_Parent_1.GetFakeNeutralTeam);
local v11 = require(l_Parent_1.PlayerSorting);
local v12 = v2.PureComponent:extend("PlayerListSorter");
v12.init = function(v13)
    v13.state = {
        sortedPlayers = {}, 
        playerKeys = {}
    };
end;
local function _(v14, v15)
    if v15 == nil then
        return v14.Team == nil;
    else
        return v14.TeamColor == v15.TeamColor;
    end;
end;
local function v27(v17, v18, v19, v20)
    local v21 = {};
    for _, v23 in ipairs(v17) do
        for _, v25 in ipairs(v18) do
            if if v20 == nil then v25.Team == nil else v25.TeamColor == v20.TeamColor then
                local v26 = v19[v25.UserId][v23.name];
                if type(v26) == "number" then
                    v21[v23.name] = v21[v23.name] or 0;
                    v21[v23.name] = v21[v23.name] + v26;
                end;
            end;
        end;
    end;
    return v21;
end;
local function v35(v28, v29, v30, v31)
    local v32 = {};
    for _, v34 in ipairs(v29) do
        v32[v34] = v27(v28, v30, v31, v34);
    end;
    v32[v10] = v27(v28, v30, v31, nil);
    return v32;
end;
local _ = function(v36)
    for _, v38 in ipairs(v36) do
        if v38.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v50(_, _, v42, v43)
    local v44 = {};
    local v45 = {};
    for _, v47 in ipairs(v42) do
        if v45[v47.TeamColor.Number] == nil then
            v45[v47.TeamColor.Number] = true;
            v44[#v44 + 1] = {
                team = v47, 
                originalPos = v47.ChildOrder
            };
        end;
    end;
    if v43 then
        v44[#v44 + 1] = {
            team = v10, 
            originalPos = #v44 + 1
        };
    end;
    table.sort(v44, function(v48, v49)
        if v48.team == v10 then
            return false;
        elseif v49.team == v10 then
            return true;
        else
            return v48.originalPos < v49.originalPos;
        end;
    end);
    return v44;
end;
v12.validateProps = v5.strictInterface({
    screenSizeY = v5.integer, 
    entrySize = v5.integer, 
    players = v5.array(v6), 
    teams = v5.array(v5.instanceIsA("Team")), 
    playerTeam = v5.map(v5.integer, v5.instanceIsA("Team")), 
    playerKeys = v5.strictInterface({
        keys = v5.map(v6, v5.strictInterface({
            name = v5.string, 
            stat = v5.union(v5.number, v5.string, v5.none)
        })), 
        primaryStat = v5.optional(v5.string)
    }), 
    playerStats = v5.map(v5.integer, v5.map(v5.string, v5.any)), 
    gameStats = v5.array(v5.strictInterface({
        name = v5.string, 
        text = v5.string, 
        addId = v5.integer, 
        isPrimary = v5.boolean, 
        priority = v5.number
    }))
});
v12.render = function(v51)
    local v52 = not not v51.props.gameStats[1] and v51.props.gameStats[1].name or nil;
    local l_sortedPlayers_0 = v51.state.sortedPlayers;
    if v4.isEmpty(v51.props.teams) then
        return v2.createElement(v8, {
            sortedPlayers = l_sortedPlayers_0, 
            sortedTeams = nil, 
            teamColorToPlayerMap = nil, 
            teamScores = nil, 
            screenSizeY = v51.props.screenSizeY, 
            entrySize = v51.props.entrySize
        });
    else
        local v54 = v35(v51.props.gameStats, v51.props.teams, v51.props.players, v51.props.playerStats);
        local v55;
        for _, v57 in ipairs(v51.props.players) do
            if v57.Team == nil then
                v55 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v55 = false;
        ::label0::;
        local v58 = v50(v54, v52, v51.props.teams, v55);
        local v59 = {};
        for _, v61 in ipairs(l_sortedPlayers_0) do
            if v61.TeamColor and v51.props.playerTeam[v61.UserId] ~= nil then
                if not v59[v61.TeamColor.Number] then
                    v59[v61.TeamColor.Number] = {
                        v61
                    };
                else
                    table.insert(v59[v61.TeamColor.Number], v61);
                end;
            end;
        end;
        return v2.createElement(v8, {
            sortedPlayers = l_sortedPlayers_0, 
            sortedTeams = v58, 
            teamColorToPlayerMap = v59, 
            teamScores = v54, 
            screenSizeY = v51.props.screenSizeY, 
            entrySize = v51.props.entrySize
        });
    end;
end;
v12.getDerivedStateFromProps = v11.getDerivedStateFromProps;
return v3.connect(function(v62)
    return {
        gameStats = v62.gameStats, 
        teams = v62.teams, 
        players = v62.players, 
        playerKeys = v62.playerKeys, 
        playerStats = v62.playerStats, 
        playerTeam = v62.playerTeam
    };
end, nil)(v12);
