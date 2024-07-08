local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v5 = {};
v5.__index = v5;
local v6 = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "http:", "https:"), "www", "friends") .. "v1/users/{userId}/friends/count";
v5.GetFriendCountAsync = function(_, v8)
    local v9 = nil;
    local l_status_0, l_result_0 = pcall(function()
        return l_HttpRbxApiService_0:GetAsyncFullUrl((string.gsub(v6, "{userId}", (tostring(v8)))));
    end);
    if l_status_0 then
        l_result_0 = l_HttpService_0:JSONDecode(l_result_0);
        if l_result_0.count then
            v9 = l_result_0.count;
        end;
        return v9;
    else
        print(v6, "failed because", l_result_0);
        return nil;
    end;
end;
v5.MaxFriendCount = function(_)
    return 200;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
l_LocalPlayer_0.FriendStatusChanged:connect(function(v15, v16)
    if v16 == Enum.FriendStatus.Friend then
        l_BindableEvent_0:Fire(v15);
        return ;
    else
        if v16 == Enum.FriendStatus.NotFriend then
            l_BindableEvent_1:Fire(v15);
        end;
        return ;
    end;
end);
l_StarterGui_0:RegisterGetCore("PlayerFriendedEvent", function()
    return l_BindableEvent_0;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnfriendedEvent", function()
    return l_BindableEvent_1;
end);
return v5;
