game:DefineFastInt("LuaAppUseNewTwoStepFlowOnLoginRollout2", 0);
game:DefineFastFlag("LuaAppUseNewTwoStepFlowOnLoginRolloutEnabledForAll2", false);
return function(v0)
    if not game:GetFastFlag("LuaAppUseNewTwoStepFlowOnLoginRolloutEnabledForAll2") then
        local l_game_FastInt_0 = game:GetFastInt("LuaAppUseNewTwoStepFlowOnLoginRollout2");
        if l_game_FastInt_0 <= 0 then
            return false;
        elseif not v0 or v0 == "" then
            return false;
        else
            return (v0 + 82) % 100 < l_game_FastInt_0;
        end;
    else
        return true;
    end;
end;
