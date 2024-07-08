game:DefineFastInt("LuaAppRecommendedGamesCount", 6);
return function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppRecommendedGamesCount");
    if l_game_FastInt_0 > 20 then
        warn("Maximum Recommended Games Fetch Count has exceeded 20: ", l_game_FastInt_0);
    end;
    return l_game_FastInt_0;
end;
