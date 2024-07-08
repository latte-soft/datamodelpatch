local l_AdService_0 = game:GetService("AdService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v4 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v5 = require(l_CorePackages_0.Promise);
local v6 = require(l_CorePackages_0.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_RobloxTranslator_0 = require(l_RobloxGui_0.Modules:WaitForChild("RobloxTranslator"));
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableTeleportBackButton);
local v12 = require(l_RobloxGui_0.Modules.Flags.GetFStringTeleportBackButtonIXPCustomLayerName);
local v13 = 0;
local l_l_AdService_0_AdTeleportInfo_0, v15 = l_AdService_0:GetAdTeleportInfo();
if l_l_AdService_0_AdTeleportInfo_0 > 0 and (not (v15 ~= 0) or v15 == game.GameId) then
    v13 = l_l_AdService_0_AdTeleportInfo_0;
end;
local v16 = nil;
local v19 = v5.defer(function(v17)
    if v13 > 0 then
        l_GetGameNameAndDescription_0(v8, v13):andThen(function(v18)
            v16 = v18.Name;
        end):await();
        v17();
        return ;
    else
        v17();
        return ;
    end;
end);
local v20 = {
    getTooltipText = function()
        if v16 == nil then
            return l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.ReturnFallback");
        else
            return l_RobloxTranslator_0:FormatByKey("InGame.CommonUI.Label.ReturnTo", {
                placeName = v16
            });
        end;
    end
};
v20.getTooltipTextTimeout = function()
    if v16 == nil then
        v5.any({
            v19, 
            v5.delay(1)
        }):await();
    end;
    return v20.getTooltipText();
end;
v20.getMenuText = function()
    local v21, v22 = v6.createBinding(v20.getTooltipText());
    if v16 == nil then
        pcall(function()
            v19:andThen(function()
                v22(v20.getTooltipText());
            end);
        end);
    end;
    return v21;
end;
v20.initiateBackButtonTeleport = function(v23)
    l_AdService_0:ReturnToPublisherExperience(v23);
end;
v20.connectExperimentUserLayer = function(v24, v25, v26)
    local v27 = v11() and v13 > 0;
    return v4.connectUserLayer({
        v12()
    }, function(v28, _)
        return {
            [v25] = v27 and ((v28[v12()] or {})[v26] or false)
        };
    end)(v24);
end;
return v20;
