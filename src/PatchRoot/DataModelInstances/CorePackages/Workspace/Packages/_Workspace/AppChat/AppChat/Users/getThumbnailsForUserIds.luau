local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v3)
    return v1.List.map(v3, function(v4)
        return l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v4)));
    end);
end;
