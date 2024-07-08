local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local l_SocialLibraries_0 = v1.SocialLibraries;
local _ = require(l_Parent_0.Reducers.Root);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v6, v7)
    local v8 = v7.profileUserId or "";
    local v9 = l_getDeepValue_0(v6, string.format("Profile.AdditionalUserFields.%s.isDeleted", v8));
    local v10 = l_getDeepValue_0(v6, string.format("Profile.CurrentlyWearing.%s", v8));
    local v11 = {
        profilePageDataStatus = v6.Profile.ProfilePageDataStatus[v8] or l_RetrievalStatus_0.NotStarted.rawValue(), 
        isDeleted = v9 or false, 
        description = l_getDeepValue_0(v6, string.format("Profile.AdditionalUserFields.%s.description", v8)) or ""
    };
    local v12;
    if v10 then
        v12 = true;
        if not (#v10 <= 0) then
            goto label0;
        end;
    end;
    v12 = false;
    ::label0::;
    v11.isCurrentlyWearingAnything = v12;
    return v11;
end;
