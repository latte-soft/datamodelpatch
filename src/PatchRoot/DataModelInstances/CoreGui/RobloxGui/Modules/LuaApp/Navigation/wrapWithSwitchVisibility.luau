local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v4 = require(l_CorePackages_0.Roact);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.AppPageProperties);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local v9 = require(l_Modules_0.LuaApp.Components.AppHeaderBarContainer);
local v10 = require(l_Modules_0.LuaApp.Hooks.usePageNavigationOptions);
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local l_GetFFlagEnableResponsiveProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableResponsiveProvider;
local function v15(v13)
    for v14 = #v13, 1, -1 do
        if not (v6[v13[v14].routeName] or {}).renderUnderlyingPage then
            return v14;
        end;
    end;
    return 1;
end;
local function _(v16, v17)
    for v18, v19 in ipairs(v16) do
        if v19.routeName == v17 then
            return v18;
        end;
    end;
    return 0;
end;
local function v26(v21)
    local v23 = l_useSelector_0(function(v22)
        return v22.TopBar.topBarHeight;
    end);
    local l_headerBarDisplayOption_0 = v10().headerBarDisplayOption;
    local v25 = (not l_headerBarDisplayOption_0 or l_headerBarDisplayOption_0 == "HideAll") and 0 or v23;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, v25), 
        Size = UDim2.new(1, 0, 1, -v25)
    }, v21.children);
end;
local function v28(_)
    return v2.createElement("Frame", {
        ZIndex = -100, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        ref = v2.useContext(v3.ContainerRef)
    });
end;
return function(v29)
    local v30 = v4.Component:extend("rootNavigatorWrapper");
    v30.render = function(v31)
        local l_routes_0 = v31.props.navigation.state.routes;
        local l_TempRnSwitchNavigatorName_0 = v7.TempRnSwitchNavigatorName;
        local v34;
        for v35, v36 in ipairs(l_routes_0) do
            if v36.routeName == l_TempRnSwitchNavigatorName_0 then
                v34 = v35;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v34 = 0;
        ::label0::;
        return v4.createElement(v8.Provider, {
            value = v15(l_routes_0) <= v34
        }, {
            ResponsiveContainerFrame = if not l_GetFFlagEnableResponsiveProvider_0() then nil else v4.createElement(v28), 
            Navigator = if not v11 then v4.createElement(v29, v31.props) else v4.createElement(v26, {
                navigation = v31.props.navigation
            }, {
                Navigator = v4.createElement(v29, v31.props)
            }), 
            AppHeaderBar = if not v11 then nil else v4.createElement(v9)
        });
    end;
    v30.router = v29.router;
    return v30;
end;
