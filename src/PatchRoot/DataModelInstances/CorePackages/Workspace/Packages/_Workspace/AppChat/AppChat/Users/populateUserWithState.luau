local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_getUserDisplayName_0 = require(l_script_FirstAncestor_0.SocialLibraries).User.getUserDisplayName;
local v3 = require(script.Parent.getThumbnailsForUserIds);
local v4 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v5 = require(script.Parent.userPresenceUtils);
return function(v6, v7, v8)
    local v9 = v5.getUserDisplayPresence(v4.Selectors.getUserPresenceByUserId(v6, v7.id), v7.id == v6.LocalUserId);
    return v1.Dictionary.join(v7, {
        isLocalUser = v6.LocalUserId == v7.id, 
        displayName = if not v8 then l_getUserDisplayName_0(v6, v7) else v8.names.combinedName, 
        presenceText = v9.text, 
        presenceImage = v9.image, 
        thumbnail = v3({
            v7.id
        })[1]
    });
end;
