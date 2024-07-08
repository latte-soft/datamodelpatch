local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.App.RemoteDisplaying);
local l_useExternalEvent_0 = require(l_Parent_0.RoactUtils).Hooks.useExternalEvent;
local l_useState_0 = v2.useState;
return function(v6)
    local v7, v8 = l_useState_0(v6 or false);
    l_useExternalEvent_0(v3.BindableEvent.Event, function(v9)
        v8(v9);
    end);
    return v7;
end;
