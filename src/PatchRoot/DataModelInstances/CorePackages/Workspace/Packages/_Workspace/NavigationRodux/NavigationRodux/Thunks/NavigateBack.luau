local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunks.SetNavigationLocked);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_script_FirstAncestor_0.Thunks.RNAdapterThunk);
return function(v6)
    v3.isTypeOrNil(v6, "boolean", "bypassNavigationLock");
    return v5.new("NavigateBack", function(v7, v8)
        if not v7:getState().Navigation.lockNavigationActions or v6 then
            v7:dispatch(v2(true));
            v8(v4.Actions.back());
            return ;
        else
            return ;
        end;
    end);
end;
