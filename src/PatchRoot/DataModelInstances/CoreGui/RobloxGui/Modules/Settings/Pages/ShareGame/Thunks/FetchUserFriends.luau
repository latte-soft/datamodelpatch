local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v4 = require(l_ShareGame_0.Thunks.ApiFetchUsersFriends);
local v5 = require(l_ShareGame_0.Constants);
local v6 = require(l_RobloxGui_0.Modules.Settings.Enum.UserSorts);
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
return function(v8, v9)
    return function(v10)
        if v10:getState().Friends.retrievalStatus[v9] ~= l_RetrievalStatus_0.Fetching then
            v10:dispatch(v4(v8, v9, v5.ThumbnailRequest.InviteToGame, if not l_GetFFlagInviteListRerank_0() then nil else v6.StatusFrequents));
        end;
    end;
end;
