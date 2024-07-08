local l_Players_0 = game:GetService("Players");
game:DefineFastInt("AppChatChannelsAPIRolloutPercentRC1", 0);
game:DefineFastFlag("AppChatChannelsAPIRolloutRC1", false);
game:DefineFastFlag("AppChatChannelsAPIForAllRC1", false);
local function _()
    return game:GetFastFlag("AppChatChannelsAPIForAllRC1");
end;
local function _()
    if game:GetFastFlag("AppChatChannelsAPIRolloutRC1") then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return false;
        else
            return l_LocalPlayer_0.UserId % 100 < game:GetFastInt("AppChatChannelsAPIRolloutPercentRC1");
        end;
    else
        return false;
    end;
end;
return function()
    local l_AppChatChannelsAPIForAllRC1_0 = game:GetFastFlag("AppChatChannelsAPIForAllRC1");
    if not l_AppChatChannelsAPIForAllRC1_0 then
        if game:GetFastFlag("AppChatChannelsAPIRolloutRC1") then
            local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
            if not l_LocalPlayer_1 then
                l_AppChatChannelsAPIForAllRC1_0 = false;
            else
                return l_LocalPlayer_1.UserId % 100 < game:GetFastInt("AppChatChannelsAPIRolloutPercentRC1");
            end;
        else
            return false;
        end;
    end;
    return l_AppChatChannelsAPIForAllRC1_0;
end;
