local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetGameNameAndDescription);
local v4 = require(l_Parent_0.Network.httpRequest)(l_HttpRbxApiService_0);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
return function(v6)
    if game.GameId == 0 then
        return ;
    else
        l_GetGameNameAndDescription_0(v4, game.GameId):andThen(function(v7)
            v6:dispatch(v3(v7.Name, v7.Description));
        end):catch(function()
            warn("Unable to retrieve game name for in game menu");
        end);
        return ;
    end;
end;
