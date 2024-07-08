local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppTempCommon_0 = l_CorePackages_0.AppTempCommon;
local l_ShareGame_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame;
local v3 = require(l_AppTempCommon_0.LuaApp.Thunks.ApiSendGameInvite);
local l_ApiFetchPlaceInfos_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_ShareGame_0.Actions.ReceivedUserInviteStatus);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
return function(v8, v9, v10)
    return function(v11)
        if v10 == "0" then
            warn("Game Invite failed to send. Cannot send invite to unpublished Place.");
            v11:dispatch(v6(v9, l_InviteStatus_0.Failed));
            return v5.reject();
        else
            local v12 = v11:getState();
            return v5.new(function(v13, v14)
                if v12.Invites[tostring(v9)] == l_InviteStatus_0.Pending then
                    v14();
                    return ;
                else
                    v13();
                    return ;
                end;
            end):andThen(function()
                local v15 = v12.PlaceInfos[v10];
                return v5.new(function(v16, v17)
                    v11:dispatch(v6(v9, l_InviteStatus_0.Pending));
                    if not v15 then
                        v11:dispatch(l_ApiFetchPlaceInfos_0(v8, {
                            v10
                        })):andThen(function(v18)
                            if v18[1] ~= nil then
                                v16(v18[1]);
                                return ;
                            else
                                v17();
                                return ;
                            end;
                        end, function()
                            v17();
                        end);
                        return ;
                    else
                        v16(v15);
                        return ;
                    end;
                end):andThen(function(v19)
                    return v11:dispatch(v3(v8, v9, v19));
                end):andThen(function(v20)
                    v11:dispatch(v6(v9, v20.resultType));
                    return v20;
                end, function()
                    v11:dispatch(v6(v9, l_InviteStatus_0.Failed));
                end);
            end);
        end;
    end;
end;
