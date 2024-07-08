local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v5 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local v6 = require(script.Parent.Parent.Actions.SetPlaceInfo);
return function(v7)
    return function(v8)
        if v7 == 0 then
            return ;
        else
            l_GetGameNameAndDescription_0(v5, v7):andThen(function(v9)
                v8:dispatch(v6(v9.Name, v9.Description));
            end):catch(function()
                warn("Unable to fetch place info for TrustAndSafety.");
            end);
            return ;
        end;
    end;
end;
