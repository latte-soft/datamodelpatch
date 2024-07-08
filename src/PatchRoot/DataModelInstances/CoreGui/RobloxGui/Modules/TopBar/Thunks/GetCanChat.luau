local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(script.Parent.Parent.Actions.SetCanChat);
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.ChatSelector);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
return function(v7)
    coroutine.wrap(function()
        local v8 = true;
        if not l_RunService_0:IsStudio() then
            local l_status_0, l_result_0 = pcall(function()
                return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
            end);
            v8 = l_status_0 and l_result_0;
        end;
        v7:dispatch(v4(v8));
        if not v8 then
            v5:SetVisible(false);
        end;
    end)();
end;
