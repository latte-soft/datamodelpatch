local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local v6 = require(script.Parent.Parent.Actions.GameNameFetched);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
return function(v8)
    if game.GameId == 0 then
        return v4.resolve();
    else
        return l_GetGameNameAndDescription_0(v5, game.GameId):andThen(function(v9)
            v8:dispatch(v6(v9.Name));
            return v9.Name;
        end, function()
            warn("Unable to get game name for Avatar Editor Prompts");
            return v4.reject();
        end);
    end;
end;
