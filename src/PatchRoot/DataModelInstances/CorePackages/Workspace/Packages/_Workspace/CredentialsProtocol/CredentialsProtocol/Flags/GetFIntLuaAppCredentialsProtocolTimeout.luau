game:DefineFastInt("LuaAppCredentialsProtocolTimeout", 20);
return function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppCredentialsProtocolTimeout");
    if l_game_FastInt_0 <= 20 then
        return 20;
    else
        return l_game_FastInt_0;
    end;
end;
