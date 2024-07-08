game:DefineFastInt("LuaAppChallengeDialogEventReceiverRetryTimes", 3);
return function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppChallengeDialogEventReceiverRetryTimes");
    if l_game_FastInt_0 < 0 then
        l_game_FastInt_0 = 3;
    end;
    return l_game_FastInt_0;
end;
