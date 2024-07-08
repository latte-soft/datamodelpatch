local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.React);
local l_useLazyRef_0 = require(l_Parent_0.UIBlox).Core.Hooks.useLazyRef;
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v6 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Hooks.useProcessNavigationStateChange);
local _ = require(l_Parent_0.Navigation);
local l_FFlagUnifyNavigationGraph_0 = require(l_Parent_0.SharedFlags).FFlagUnifyNavigationGraph;
return function(v9)
    local l_rnBypassActionSignal_0 = v9.rnBypassActionSignal;
    local v11 = l_useNavigation_0();
    if l_FFlagUnifyNavigationGraph_0 then
        local v13 = l_useLazyRef_0(function()
            return l_rnBypassActionSignal_0:connect(function(v12)
                v11.dispatch(v12);
            end);
        end);
        local l_v13_0 = v13 --[[ copy: 3 -> 4 ]];
        v3.useEffect(function()
            l_v13_0.current:disconnect();
        end, {});
    end;
    v3.useEffect(function()
        local v16 = l_rnBypassActionSignal_0:connect(function(v15)
            v11.dispatch(v15);
        end);
        return function()
            v16:disconnect();
        end;
    end, {
        v11, 
        l_rnBypassActionSignal_0
    });
    if l_FFlagUnifyNavigationGraph_0 then
        local v17 = v6(v9.ApplyRoactNavigationHistory, v9.updateRoute);
        v3.useEffect(function()
            v17(nil, v11.state, nil);
        end, {
            v11.state
        });
    end;
    return nil;
end;
