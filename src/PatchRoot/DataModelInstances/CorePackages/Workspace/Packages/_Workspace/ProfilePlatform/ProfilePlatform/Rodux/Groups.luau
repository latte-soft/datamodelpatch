local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
return v2.createReducer({}, {
    [require(l_script_FirstAncestor_0.Networking.getProfilePlatform).Succeeded.name] = function(v4, v5)
        local l_responseBody_0 = v5.responseBody;
        if l_responseBody_0.profileType ~= "Group" then
            return v4;
        else
            return v3.Dictionary.join(v4, {
                [l_responseBody_0.profileId] = l_responseBody_0
            });
        end;
    end
});
