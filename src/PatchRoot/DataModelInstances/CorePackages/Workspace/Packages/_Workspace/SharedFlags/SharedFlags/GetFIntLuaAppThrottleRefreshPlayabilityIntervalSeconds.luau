game:DefineFastInt("LuaAppThrottleRefreshPlayabilityIntervalSeconds", 1800);
return function()
    return game:GetFastInt("LuaAppThrottleRefreshPlayabilityIntervalSeconds");
end;
