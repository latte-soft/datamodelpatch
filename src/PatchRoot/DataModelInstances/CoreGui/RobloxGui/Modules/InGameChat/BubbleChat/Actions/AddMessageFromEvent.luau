local l_Players_0 = game:GetService("Players");
local v1 = require(game:GetService("CorePackages").ExperienceChat);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(script.Parent.Parent.Types);
local v4 = require(script.Parent.Parent.Helpers.maybeAssert);
local v5 = require(script.Parent.AddMessageWithTimeout);
local v6 = require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat);
return function(v7)
    v4(v3.IMessageData(v7));
    return function(v8)
        local l_status_0, l_result_0 = pcall(function()
            return l_Players_0:GetPlayerByUserId(v7.SpeakerUserId);
        end);
        if not (not l_status_0 or not l_result_0) then
            local l_Character_0 = l_result_0.Character;
            if l_Character_0 then
                local v12 = {
                    id = tostring(v7.ID), 
                    userId = tostring(v7.SpeakerUserId), 
                    name = v7.FromSpeaker, 
                    text = v7.Message or "", 
                    timestamp = v7.Time, 
                    adornee = l_Character_0
                };
                if v6() then
                    local l_Events_0 = v1.Events;
                    if l_Events_0.LegacyBubbleCreated ~= nil then
                        l_Events_0.LegacyBubbleCreated(v12);
                    end;
                end;
                return v8:dispatch(v5(v12));
            end;
        end;
    end;
end;
