local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Components.Games.GameGrid);
local v4 = require(l_Modules_0.LuaApp.Components.Games.GameGridTable);
local v5 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v6 = require(l_Modules_0.LuaApp.Experiment.useUserExperiment);
local v7 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppEnableGameGridTable);
local v10 = {
    v7.GridUILayer
};
local function v12(v11)
    return (v11[v7.GridUILayer] or {}).IsGameGridDesktopRefreshEnabled or false;
end;
return function(v13)
    local v14 = v13.currentSidePadding or 0;
    local v16 = v5(function(v15)
        return v15.useGridPageLayout();
    end);
    local v17 = not not v9 or v6(v10, v12);
    if not v16 or not v17 then
        return v1.createElement(v3, v13);
    else
        return v1.createElement("Frame", {
            Position = UDim2.fromOffset(-v14, 0), 
            Size = UDim2.new(1, v14 * 2, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v13.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            GridTable = v1.createElement(v4, v13)
        });
    end;
end;
