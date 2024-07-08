local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local l_withStyle_0 = v3.Style.withStyle;
local v6 = Vector2.new(375, 70);
local v7 = require(l_Modules_0.LuaApp.Components.More.DevSubGame);
local v8 = v2.PureComponent:extend("DevSubGameList");
local function v20(v9, _)
    local v11 = {};
    local v12 = {};
    for _, v14 in pairs(v9) do
        if v14.activeSubs > 0 then
            table.insert(v11, v14);
        else
            table.insert(v12, v14);
        end;
    end;
    local v15 = {};
    for _, v17 in pairs(v11) do
        table.insert(v15, v17);
    end;
    for _, v19 in pairs(v12) do
        table.insert(v15, v19);
    end;
    return v15;
end;
v8.render = function(v21)
    return l_withStyle_0(function(_)
        local l_props_0 = v21.props;
        local l_games_0 = l_props_0.games;
        local l_subsByGameId_0 = l_props_0.subsByGameId;
        local l_onGameActivated_0 = l_props_0.onGameActivated;
        local v27 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 0)
            })
        };
        l_games_0 = v20(l_games_0, l_subsByGameId_0);
        for v28, v29 in pairs(l_games_0) do
            local v30 = {};
            for _, v32 in pairs(l_subsByGameId_0[v29.id]) do
                table.insert(v30, v32.name);
            end;
            table.insert(v27, v2.createElement(v7, {
                game = v29, 
                subNames = v30, 
                activeSubs = v29.activeSubs, 
                active = v29.activeSubs > 0, 
                dividerDisabled = v28 == #l_games_0, 
                onActivated = function()
                    l_onGameActivated_0(v29);
                end, 
                maxSize = v6, 
                layoutOrder = v28
            }));
        end;
        return v2.createElement(v4.FitFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            fitFields = {
                Size = v4.FitAxis.Height
            }
        }, v27);
    end);
end;
return v8;
