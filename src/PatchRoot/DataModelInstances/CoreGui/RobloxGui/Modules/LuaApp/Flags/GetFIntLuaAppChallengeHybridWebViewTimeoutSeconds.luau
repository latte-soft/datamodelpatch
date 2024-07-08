game:DefineFastInt("LuaAppChallengeHybridWebViewTimeoutSeconds", 5);
return function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppChallengeHybridWebViewTimeoutSeconds");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 5;
    end;
    return l_game_FastInt_0;
end;
