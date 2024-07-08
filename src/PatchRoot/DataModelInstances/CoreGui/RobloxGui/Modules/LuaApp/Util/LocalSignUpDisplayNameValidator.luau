local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Enum.UsernameIssue);
return {
    isLengthTooShortOrTooLong = function(v4)
        v2.isType(v4, "string", "displayName passed into isLengthTooShortOrTooLong");
        local v5 = string.len(v4);
        local v6 = true;
        if v5 >= 3 then
            v6 = v5 > 20;
        end;
        return v6;
    end, 
    hasBoundingUnderscore = function(v7)
        v2.isType(v7, "string", "displayName passed into hasBoundingUnderscore");
        local v8 = true;
        if string.sub(v7, 1, 1) ~= "_" then
            v8 = string.sub(v7, -1) == "_";
        end;
        return v8;
    end, 
    hasMultipleUnderscores = function(v9)
        v2.isType(v9, "string", "displayName passed into hasMultipleUnderscores");
        local _, v11 = string.gsub(v9, "_", "");
        return v11 > 1;
    end, 
    containsInvalidCharacter = function(v12)
        v2.isType(v12, "string", "displayName passed into containsInvalidCharacter");
        return utf8.len(v12) == nil;
    end, 
    locallyValidateDisplayName = function(v13, v14)
        v2.isType(v14, "string", "username passed into locallyValidateDisplayName");
        return {
            [v3.LengthTooShortOrTooLong] = v13.isLengthTooShortOrTooLong(v14), 
            [v3.BoundingUnderscore] = v13.hasBoundingUnderscore(v14), 
            [v3.MultipleUnderscores] = v13.hasMultipleUnderscores(v14), 
            [v3.ContainsInvalidCharacter] = v13.containsInvalidCharacter(v14)
        };
    end
};
