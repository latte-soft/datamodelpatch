local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v3 = require(l_ShareGame_0.Constants);
local v4 = require(l_ShareGame_0.Actions.OpenPage);
local v5 = require(l_ShareGame_0.Actions.ClosePage);
return function(v6, v7)
    v6 = v6 or {
        IsOpen = false, 
        Route = v3.PageRoute.NONE
    };
    if v7.type == v4.name then
        return (l_Immutable_0.JoinDictionaries(v6, {
            IsOpen = true, 
            Route = v7.route or v3.PageRoute.NONE
        }));
    else
        if v7.type == v5.name then
            v6 = l_Immutable_0.JoinDictionaries(v6, {
                IsOpen = false, 
                Route = v7.route or v3.PageRoute.NONE
            });
        end;
        return v6;
    end;
end;
