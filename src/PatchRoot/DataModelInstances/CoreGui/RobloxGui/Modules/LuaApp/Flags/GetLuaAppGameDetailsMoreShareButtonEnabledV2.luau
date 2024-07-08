game:DefineFastInt("LuaAppGameDetailsMoreShareButtonRolloutV2", 0);
return function(v0)
    local l_game_FastInt_0 = game:GetFastInt("LuaAppGameDetailsMoreShareButtonRolloutV2");
    if l_game_FastInt_0 <= 0 then
        return false;
    elseif not v0 or v0 == "" then
        return false;
    else
        return (v0 + 55) % 100 < l_game_FastInt_0;
    end;
end;
