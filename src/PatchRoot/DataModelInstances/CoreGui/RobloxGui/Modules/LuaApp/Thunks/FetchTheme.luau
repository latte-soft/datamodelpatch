local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.GetTheme);
game:DefineFastFlag("FixFetchThemePromiseRejection", false);
return function(v1, v2)
    return v0(v1, v2):andThen(function(v3)
        local v4 = v3[1];
        if not game:GetFastFlag("FixFetchThemePromiseRejection") then
            return (string.lower(v4.themeType));
        elseif not v4 then
            return string.lower("light");
        else
            return string.lower(v4.themeType);
        end;
    end);
end;
