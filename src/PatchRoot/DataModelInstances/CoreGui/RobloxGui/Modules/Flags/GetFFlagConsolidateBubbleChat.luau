local l_Players_0 = game:GetService("Players");
game:DefineFastFlag("ConsolidateBubbleChat5", false);
game:DefineFastInt("ConsolidateBubbleChatRollout4", 0);
return function()
    if not game:GetFastFlag("ConsolidateBubbleChat5") then
        local l_game_FastInt_0 = game:GetFastInt("ConsolidateBubbleChatRollout4");
        if l_game_FastInt_0 <= 0 then
            return false;
        elseif l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId then
            return (l_Players_0.LocalPlayer.UserId + 21) % 100 < l_game_FastInt_0;
        else
            return false;
        end;
    else
        return true;
    end;
end;
