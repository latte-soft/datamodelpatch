local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.RoactNavigation);
local v6 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v7 = require(l_Modules_0.LuaApp.FlagSettings);
local v8 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local function v12()
    return {
        {
            name = v7.GetDefaultAppPage(), 
            rnKey = v7.GetDefaultAppPage()
        }
    };
end;
local _, v14 = require(l_Modules_0.LuaApp.GetIABottomBarItems)();
local v15 = {};
for _, v17 in ipairs((require(l_Modules_0.LuaApp.BottomBarItems))) do
    v15[v17.page] = true;
end;
local function v22(v18, v19)
    if v18 == v10.Landing then
        return true;
    elseif not (v19 ~= nil) or v19.routes == nil then
        return false;
    else
        for _, v21 in v19.routes, nil, nil do
            if v21.routeName == v18 then
                return true;
            elseif (v21.routes and #v21.routes > 0) and v21.routes[1].routeName == v18 then
                return true;
            end;
        end;
        return false;
    end;
end;
return function(v23, v24)
    return v6.new("ResetNavigationHistory", function(v25, v26)
        local l_v23_0 = v23;
        if v24 ~= nil then
            l_v23_0 = v24[#v24];
        end;
        if not (l_v23_0 ~= nil) or #l_v23_0 == 0 then
            l_v23_0 = v12();
        end;
        assert(l_v23_0, "not nil");
        if not (not (l_GuiService_0:IsTenFootInterface() and #l_v23_0 == 1) or l_FFlagUnifyNavigationGraph_0) then
            local v28 = l_v23_0[1];
            if v22(v28.name, v25:getState().Navigation.roactNavigationState) then
                v25:dispatch(v3(true));
                v26(v5.Actions.navigate({
                    routeName = v28.name, 
                    key = v28.rnKey, 
                    params = v4.Dictionary.join(v28, {
                        name = v4.None, 
                        rnKey = v4.None
                    })
                }));
                return ;
            end;
        end;
        local v29 = {};
        for _, v31 in ipairs(l_v23_0) do
            local v32 = v5.Actions.navigate({
                routeName = v31.name, 
                params = v4.Dictionary.join(v31, {
                    name = v4.None, 
                    rnKey = v4.None
                }), 
                key = v31.rnKey
            });
            if not if not l_FFlagUnifyNavigationGraph_0 then v15[v31.name] == true else v14[v31.name] ~= nil then
                table.insert(v29, v32);
            else
                table.insert(v29, v5.Actions.navigate({
                    routeName = v8.TempRnSwitchNavigatorName, 
                    action = v32, 
                    key = v8.TempRnSwitchNavigatorName
                }));
            end;
        end;
        v25:dispatch(v3(true));
        v26(v5.StackActions.reset({
            index = #v29, 
            actions = v29
        }));
    end);
end;
