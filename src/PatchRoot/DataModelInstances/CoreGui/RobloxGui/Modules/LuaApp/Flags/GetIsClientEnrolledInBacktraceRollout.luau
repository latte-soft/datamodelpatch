game:DefineFastInt("LuaAppBacktraceErrorReportPercentage", 5);
local v0 = math.random(1, 100);
return function()
    return v0 <= math.clamp(game:GetFastInt("LuaAppBacktraceErrorReportPercentage"), 0, 100);
end;
