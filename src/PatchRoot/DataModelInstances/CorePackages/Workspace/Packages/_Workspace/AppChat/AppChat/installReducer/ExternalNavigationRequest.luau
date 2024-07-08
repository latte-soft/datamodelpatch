local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
return require(l_Parent_0.Rodux).createReducer({
    screen = nil, 
    params = nil, 
    requestId = 0, 
    completedRequestId = 0
}, {
    [require(l_script_FirstAncestor_0.Actions.NavigateIntoChat).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            screen = v4.screen, 
            params = v4.params, 
            requestId = v3.requestId + 1
        });
    end, 
    [require(l_script_FirstAncestor_0.Actions.CompleteExternalNavigationIntoChat).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            completedRequestId = v6.requestId
        });
    end
});
