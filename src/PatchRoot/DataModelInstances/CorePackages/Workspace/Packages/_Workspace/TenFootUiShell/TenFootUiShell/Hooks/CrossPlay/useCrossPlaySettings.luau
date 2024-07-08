local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.useCrossPlayApi);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Networking).roduxNetworking.Enum.NetworkStatus;
local v7 = require(l_script_FirstAncestor_0.Selectors.getCrossPlayIsEnabled);
return function()
    local v8 = v5();
    local v9 = l_useSelector_0(v7);
    local v11 = l_useSelector_0(function(v10)
        return v3.List.find(v3.Dictionary.values(v10.CrossPlaySettings.NetworkStatus), l_NetworkStatus_0.Fetching) ~= nil;
    end);
    local v13 = l_useSelector_0(function(v12)
        return v12.CrossPlaySettings.HttpError;
    end);
    local v15 = l_useSelector_0(function(v14)
        return v14.CrossPlaySettings.DispatchError;
    end);
    local v17 = l_useSelector_0(function(v16)
        return v16.CrossPlaySettings.SystemError;
    end);
    local v19 = l_useSelector_0(function(v18)
        return v18.CrossPlaySettings.SystemPrivileges;
    end);
    local v20 = (v13 or v15) or v17;
    return {
        isEnabled = v9, 
        systemPrivileges = v19, 
        hasError = v20 ~= nil, 
        isLoading = v11 and not v20, 
        toggle = v2.useCallback(function()
            return v8.update(not v9);
        end, {
            v8.update, 
            v9
        }), 
        reload = v8.fetch, 
        invokeSystemUi = v8.invokeSystemUi
    };
end;
