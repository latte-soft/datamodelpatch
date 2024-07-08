local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v5 = {};
local v6 = nil;
local function v8()
    local v7 = l_Http_0.GetUserVoteCountFromVotingApiAsync();
    v6.VoteCount = not not v7 and v7.voteCount or 0;
end;
v5.Initialize = function(_)
    if v6 then
        l_Utility_0.DebugLog("Trying to initialize UserData when we already have valid data.");
    end;
    v6 = {};
    if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
        spawn(v8);
    end;
end;
v5.GetVoteCount = function(_)
    if v6 then
        return v6.VoteCount;
    else
        l_Utility_0.DebugLog("Error: UserData:GetVoteCount() - UserData has not been initialized. Don't do that");
        return nil;
    end;
end;
v5.IncrementVote = function(_)
    v6.VoteCount = (v6.VoteCount or 0) + 1;
end;
v5.DecrementVote = function(_)
    v6.VoteCount = math.max((v6.VoteCount or 0) - 1, 0);
end;
v5.Reset = function(_)
    v6 = nil;
end;
v5.GetLocalUserIdAsync = function()
    return v5.GetLocalPlayerAsync().userId;
end;
v5.GetLocalPlayerAsync = function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    return l_LocalPlayer_0;
end;
v5.GetTotalUserBalanceAsync = function()
    local v15 = l_Http_0.GetTotalUserBalanceAsync();
    if v15 then
        return v15.robux;
    else
        return nil;
    end;
end;
return v5;
