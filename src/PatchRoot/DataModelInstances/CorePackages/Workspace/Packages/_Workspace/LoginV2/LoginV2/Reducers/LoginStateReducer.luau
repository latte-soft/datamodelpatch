local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
return function(v3, v4, _)
    local v6 = table.clone(v3);
    local l_type_0 = v4.type;
    if l_type_0 == v2.SetUserIdentifierAndType then
        v6.userIdentifier = v4.data.userIdentifier;
        v6.userIdentifierType = v4.data.userIdentifierType;
        return v6;
    elseif l_type_0 == v2.IncrementLoginAttempts then
        v6.numLoginAttempts = v6.numLoginAttempts + 1;
        return v6;
    elseif l_type_0 == v2.ResetLoginAttempts then
        v6.numLoginAttempts = 0;
        return v6;
    else
        if l_type_0 == v2.SetAvailableLoginMethods then
            v6.availableLoginMethods = v4.data;
        end;
        return v6;
    end;
end;
