local v0 = require(script.Parent.EventNames);
local l_DiagEventTypes_0 = require(script:FindFirstAncestor("UserProfiles").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v2 = require(script.Parent.ErrorCodesForLogging);
return {
    [v0.UserProfilesRequestBegin] = {
        name = game:DefineFastString("UserProfilesRequestBegin", "UserProfilesRequestBegin")
    }, 
    [v0.UserProfilesRequestSuccess] = {
        name = game:DefineFastString("UserProfilesRequestSuccess", "UserProfilesRequestSuccess")
    }, 
    [v0.UserProfilesRequestFail] = {
        name = game:DefineFastString("UserProfilesRequestFail", "UserProfilesRequestFail")
    }, 
    [v0.UserProfilesRequestFailAfterRetry] = {
        name = game:DefineFastString("UserProfilesRequestFailAfterRetry", "UserProfilesRequestFailAfterRetry")
    }, 
    [v0.UserProfilesRequestSuccessAfterRetry] = {
        name = game:DefineFastString("UserProfilesRequestSuccessAfterRetry", "UserProfilesRequestSuccessAfterRetry")
    }, 
    [v0.UserProfilesErrorCode] = {
        type = l_DiagEventTypes_0.Counter, 
        name = function(v3)
            local v4 = tostring(v3.status);
            local l_UserProfilesErrorCode_0 = v0.UserProfilesErrorCode;
            if not v2[v4] then
                return l_UserProfilesErrorCode_0 .. "Other";
            else
                return l_UserProfilesErrorCode_0 .. v4;
            end;
        end
    }, 
    [v0.UserProfilesUnmountEarly] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserProfilesUnmountEarly", "UserProfilesUnmountEarly")
    }
};
