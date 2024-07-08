local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LoadingScreen.Actions.SetUniverseId);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v4, v5)
    local function v9(v6)
        local l_PlaceId_0 = game.PlaceId;
        local l_GameId_0 = game.GameId;
        while not (l_PlaceId_0 > 0) or l_GameId_0 <= 0 do
            wait();
            l_PlaceId_0 = game.PlaceId;
            l_GameId_0 = game.GameId;
        end;
        v6:dispatch(v2({
            universeId = l_GameId_0, 
            placeId = l_PlaceId_0
        }));
    end;
    return function(v10)
        coroutine.wrap(function()
            local l_v5_0 = v5;
            local l_GameId_1 = game.GameId;
            if l_v5_0 > 0 and l_GameId_1 <= 0 then
                v4(string.format("%suniverses/v1/places/%d/universe", l_Url_0.APIS_URL, l_v5_0), "GET"):andThen(function(v13)
                    if not (not v13 or not v13.responseBody) then
                        l_GameId_1 = v13.responseBody.universeId;
                        if l_GameId_1 and l_GameId_1 >= 0 then
                            v10:dispatch(v2({
                                universeId = l_GameId_1, 
                                placeId = l_v5_0
                            }));
                            return ;
                        end;
                    end;
                    v9(v10);
                end, function(_)
                    v9(v10);
                end);
            else
                v9(v10);
            end;
        end)();
    end;
end;
