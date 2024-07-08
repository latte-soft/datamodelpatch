local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Array_0 = v1.LuauPolyfill.Array;
local l_UserProfiles_0 = v1.UserProfiles;
local _ = require(script.Parent.useProfileInsightsByUserIdQuery);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagProfileUseRealNamesForMutual);
local function _(v6, v7)
    return l_Array_0.slice(v6, 1, v7 + 1);
end;
local function _(v9, v10)
    if not v9 then
        return nil;
    else
        return (l_Array_0.map(v10, function(v11)
            return l_UserProfiles_0.Selectors.getCombinedNameFromId(v9, v11);
        end));
    end;
end;
return function(v13, v14)
    local v15 = l_Array_0.slice(v13, 1, v14 + 1);
    local v17 = l_Array_0.map(v15, function(v16)
        return v16.id;
    end);
    local v18 = if not v5 then nil else l_UserProfiles_0.Hooks.useUserProfilesFetch({
        userIds = v17, 
        query = l_UserProfiles_0.Queries.userProfilesCombinedNameByUserIds
    });
    if not v5 then
        return (l_Array_0.map(v15, function(v19)
            return v19.displayName;
        end));
    else
        local l_data_0 = v18.data;
        if not l_data_0 then
            return nil;
        else
            return (l_Array_0.map(v17, function(v21)
                return l_UserProfiles_0.Selectors.getCombinedNameFromId(l_data_0, v21);
            end));
        end;
    end;
end;
