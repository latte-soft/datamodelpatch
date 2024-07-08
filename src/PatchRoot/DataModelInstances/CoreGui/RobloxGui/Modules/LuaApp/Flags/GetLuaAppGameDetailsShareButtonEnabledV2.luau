game:DefineFastInt("LuaAppGameDetailsShareButtonRolloutV2", 0);
return function(v0)
    local l_game_FastInt_0 = game:GetFastInt("LuaAppGameDetailsShareButtonRolloutV2");
    if l_game_FastInt_0 <= 0 then
        return false;
    elseif not v0 or v0 == "" then
        return false;
    else
        return (v0 + 14) % 100 < l_game_FastInt_0;
    end;
end;
