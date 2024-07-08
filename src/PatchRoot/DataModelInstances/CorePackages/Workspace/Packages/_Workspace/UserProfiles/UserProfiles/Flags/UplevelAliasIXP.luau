game:DefineFastFlag("UplevelAliasIXPSetupEnabled_v4", false);
game:DefineFastFlag("UplevelAliasIXPEnabled", false);
game:DefineFastFlag("UplevelAliasEnabledForAll", false);
local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local l_getFStringSocialFriendsLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialFriendsLayer;
local l_useUserExperiment_0 = v1.useUserExperiment;
local function v4()
    return game:GetFastFlag("UplevelAliasIXPSetupEnabled_v4");
end;
local function _()
    return game:GetFastFlag("UplevelAliasIXPEnabled");
end;
local function _()
    return game:GetFastFlag("UplevelAliasEnabledForAll");
end;
local function v10(v7)
    local v8 = (v7 or {})[l_getFStringSocialFriendsLayer_0()] or {};
    local v9;
    if game:GetFastFlag("UplevelAliasIXPEnabled") then
        v9 = true;
        if not (v8.include_alias_in_combined_name ~= true) then
            goto label0;
        end;
    end;
    v9 = game:GetFastFlag("UplevelAliasEnabledForAll");
    ::label0::;
    return v9;
end;
return {
    isSetupEnabled = v4, 
    isExperimentEnabled = v10, 
    useIsExperimentEnabled = function()
        return l_useUserExperiment_0({
            l_getFStringSocialFriendsLayer_0()
        }, v10);
    end
};
