local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Models.Conversation);
local v2 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
return function(v3)
    if v3.conversationType ~= v1.Type.MULTI_USER_CONVERSATION then
        return false;
    elseif v3.userPendingStatus == v2.UserPendingStatus.Pending then
        return true;
    elseif v3.userPendingStatus == v2.UserPendingStatus.Invalid and v3.moderationType == v2.ModerationType.TrustedComms then
        return true;
    else
        return false;
    end;
end;
