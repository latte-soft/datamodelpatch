local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5)
    v2.isType(v3, "string", "Actions.AddUsersSearchResults.keyword");
    if v4 then
        v2.isType(v4, "string", "Actions.AddUsersSearchResults.nextPageCursor");
    end;
    v2.isType(v5, "table", "Actions.AddUsersSearchResults.entries");
    return {
        keyword = v3, 
        nextPageCursor = v4, 
        entries = v5
    };
end);
