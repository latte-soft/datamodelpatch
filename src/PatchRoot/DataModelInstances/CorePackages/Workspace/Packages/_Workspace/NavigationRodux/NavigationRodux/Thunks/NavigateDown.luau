local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Thunks.SetNavigationLocked);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_script_FirstAncestor_0.Thunks.RNAdapterThunk);
return function(v7, v8)
    v4.isType(v7, "table", "page");
    v4.isTypeOrNil(v8, "boolean", "bypassNavigationLock");
    return v6.new("NavigateDown", function(v9, v10)
        if not v9:getState().Navigation.lockNavigationActions or v8 then
            v9:dispatch(v3(true));
            v10(v5.StackActions.push({
                routeName = v7.name, 
                params = v2.Dictionary.join(v7, {
                    name = v2.None, 
                    rnKey = v2.None
                })
            }));
            return ;
        else
            return ;
        end;
    end);
end;
