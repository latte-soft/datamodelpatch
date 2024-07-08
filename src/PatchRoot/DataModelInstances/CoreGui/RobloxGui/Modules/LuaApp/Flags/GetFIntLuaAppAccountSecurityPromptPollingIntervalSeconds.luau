game:DefineFastInt("LuaAppAccountSecurityPromptPollingIntervalSeconds", 600);
return function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppAccountSecurityPromptPollingIntervalSeconds");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 600;
    end;
    return l_game_FastInt_0;
end;
