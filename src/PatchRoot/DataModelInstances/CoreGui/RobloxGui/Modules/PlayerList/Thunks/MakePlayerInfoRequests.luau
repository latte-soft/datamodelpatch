local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v6 = require(l_RobloxGui_0.Modules.BlockingUtility);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v9 = {
    Admin = l_Images_0["icons/status/player/admin"], 
    Intern = l_Images_0["icons/status/player/intern"], 
    Star = l_Images_0["icons/status/player/videostar"]
};
local v10 = require(l_Parent_0.Actions.SetPlayerSpecialGroupIcon);
local v11 = require(l_Parent_0.Actions.SetPlayerIsCreator);
local v12 = require(l_Parent_0.Actions.SetPlayerAvatarIcon);
local v13 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v14 = require(l_Parent_0.Actions.SetPlayerFriendStatus);
local function v22(v15, v16, v17)
    local l_players_0 = v15:getState().players;
    local v19 = false;
    for _, v21 in ipairs(l_players_0) do
        if v16 == v21 then
            v19 = true;
            break;
        end;
    end;
    if v19 then
        v15:dispatch(v17);
    end;
end;
local function v25(v23, v24)
    if not v4.IsPlayerAdminAsync(v24) then
        if not v4.IsPlayerStarAsync(v24) then
            if v4.IsPlayerInternAsync(v24) then
                v22(v23, v24, v10(v24, v9.Intern));
            end;
            return ;
        else
            v22(v23, v24, v10(v24, v9.Star));
            return ;
        end;
    else
        v22(v23, v24, v10(v24, v9.Admin));
        return ;
    end;
end;
local function v28(v26, v27)
    if game.CreatorType ~= Enum.CreatorType.Group then
        return ;
    else
        if v4.CanPlayerManagePlaceAsync(v27) then
            v22(v26, v27, v11(v27, true));
        end;
        return ;
    end;
end;
local function v31(v29, v30)
    if v5:IsEnabled() then
        v22(v29, v30, v12(v30, "rbxthumb://type=Avatar&id=" .. v30.UserId .. "&w=100&h=100"));
        return ;
    else
        return ;
    end;
end;
local function v34(v32, v33)
    if v6:IsPlayerBlockedByUserId(v33.UserId) then
        v22(v32, v33, v13(v33, true));
    end;
end;
local function v37(v35, v36)
    if (v36 ~= l_Players_0.LocalPlayer and v36.Parent == l_Players_0) and l_Players_0.LocalPlayer.Parent == l_Players_0 then
        v22(v35, v36, v14(v36, l_Players_0.LocalPlayer:GetFriendStatus(v36)));
    end;
end;
return function(v38)
    return function(v39)
        coroutine.wrap(v25)(v39, v38);
        coroutine.wrap(v28)(v39, v38);
        coroutine.wrap(v31)(v39, v38);
        coroutine.wrap(v34)(v39, v38);
        coroutine.wrap(v37)(v39, v38);
    end;
end;
