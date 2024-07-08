local l_CoreGui_0 = game:GetService("CoreGui");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LoadingScreen.Actions.SetGameProductInfo);
return function(v3)
    return function(v4)
        coroutine.wrap(function()
            local l_v3_0 = v3;
            if not l_v3_0 or l_v3_0 <= 0 then
                while game.PlaceId <= 0 do
                    wait();
                end;
                l_v3_0 = game.PlaceId;
            end;
            local l_status_0, l_result_0 = pcall(function()
                v4:dispatch(v2((l_MarketplaceService_0:GetProductInfo(l_v3_0))));
            end);
            if not l_status_0 then
                print("LoadingScreen:GetGameProductInfo: %s", l_result_0);
            end;
        end)();
    end;
end;
