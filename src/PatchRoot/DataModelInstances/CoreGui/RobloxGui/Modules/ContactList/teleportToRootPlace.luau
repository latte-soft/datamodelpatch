local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_GamesMultigetPlaceDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails;
local v4 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(l_HttpRbxApiService_0);
return function()
    if game.PlaceId ~= 0 then
        l_GamesMultigetPlaceDetails_0(v4, game.PlaceId):andThen(function(v5)
            l_TeleportService_0:Teleport(v5.responseBody[1].universeRootPlaceId);
        end, function()
        end);
    end;
end;
