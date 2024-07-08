game:DefineFastInt("LuaAppPercentRolloutGameDetailShareButtonUseAppsflyer", 0);
return function(v0)
    if not v0 or v0 == "" then
        return false;
    else
        return (v0 + 85) % 100 < game:GetFastInt("LuaAppPercentRolloutGameDetailShareButtonUseAppsflyer");
    end;
end;
