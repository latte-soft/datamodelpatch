local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.AppPageProperties);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppTransparentPageMaxCount);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local v9 = v7();
return function(v10, v11)
    local v12 = v3.Component:extend("RNPageWrapper(" .. v11 .. ")");
    local l_v10_0 = v10;
    v10 = v4.withNavigationFocus(function(v14)
        return l_v10_0({
            isVisible = v14.isVisible, 
            displayOrder = v14.displayOrder
        }, v14.detail, v14.extraProps);
    end);
    v12.render = function(v15)
        return v3.createElement(v10, {
            isVisible = v15.props.isVisible, 
            displayOrder = v15.props.displayOrder, 
            detail = v15.props.detail, 
            extraProps = v15.props.extraProps
        });
    end;
    return (v4.withNavigation((v5.connect(function(v16, v17)
        local l_navigation_0 = v17.navigation;
        local l_key_0 = l_navigation_0.state.key;
        local v20 = l_navigation_0.getParam("detail");
        local v21 = if not l_GetFFlagEnableUnifiedWebViews_0() then l_navigation_0.getParam("extraProps") else l_navigation_0.getParam("extraProps", {});
        local l_history_0 = v16.Navigation.history;
        local v23 = l_history_0[#l_history_0];
        local v24 = 1;
        for v25 = #v23, 1, -1 do
            if not (v6[v23[v25].name] or {}).renderUnderlyingPage then
                v24 = v25;
                break;
            end;
        end;
        local v26 = math.max(v24 + 1, (#l_history_0 - v9) + 1);
        local v27 = #v23 == 1;
        local v28 = 0;
        for v29, v30 in ipairs(v23) do
            if v30.rnKey == l_key_0 then
                local v31 = true;
                if v29 ~= v24 then
                    v31 = v26 <= v29;
                end;
                v27 = v31;
                v28 = v29;
                break;
            end;
        end;
        return {
            isVisible = v27, 
            displayOrder = v28, 
            detail = v20, 
            extraProps = v21
        };
    end)(v12))));
end;
