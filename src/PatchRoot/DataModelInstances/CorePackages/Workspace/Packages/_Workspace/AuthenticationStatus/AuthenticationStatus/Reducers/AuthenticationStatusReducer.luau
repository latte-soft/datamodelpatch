local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthenticationStatus");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v3 = require(l_script_FirstAncestor_0.Actions.SetAuthenticationStatus);
local v4 = require(l_Parent_0.Cryo);
return function(v5, v6)
    v5 = v5 or {
        status = l_LoginStatus_0.UNKNOWN
    };
    if v6.type == v3.name then
        v5 = v4.Dictionary.join(v5, {
            status = v6.status
        });
    end;
    return v5;
end;
