local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigation");
local v1 = require(l_script_FirstAncestor_0.createAdaptiveStackNavigator);
local v2 = require(l_script_FirstAncestor_0.createMainSwitchNavigator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_Parent_0.NavigationRodux);
local v7 = game:DefineFastString("RootNavigatorInitialRouteName", (tostring(require(l_Parent_0.RobloxAppEnums).AppPage.PlatformAccountRouter)));
local function v8()
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v9, v10)
    local v11 = {};
    for v12, v13 in v10, nil, nil do
        v11[v13] = v12;
    end;
    local v14 = {};
    local v15 = {};
    for _, v17 in v9, nil, nil do
        if not (v11[next(v17)] ~= nil) then
            table.insert(v15, v17);
        else
            table.insert(v14, v17);
        end;
    end;
    table.sort(v14, function(v18, v19)
        return v11[next(v18)] < v11[next(v19)];
    end);
    table.insert(v15, {
        [v6.Constants.TempRnSwitchNavigatorName] = v2(v14)
    });
    return v1(v15, {
        initialRouteName = v7, 
        mode = v4.StackPresentationStyle.Overlay, 
        transitionConfig = v8, 
        defaultNavigationOptions = {
            absorbInputSelectable = false, 
            overlayTransparency = 0.3
        }
    });
end;
