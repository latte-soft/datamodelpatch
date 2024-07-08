local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Lumberyak).Logger.new(nil, "ExpChat");
local l_status_0, l_result_0 = pcall(function()
    return {
        level = game:DefineFastString("DebugLuaLogLevel", ""), 
        pattern = game:DefineFastString("DebugLuaLogPattern", "")
    };
end);
if not l_status_0 then
    l_result_0 = {
        level = "debug", 
        pattern = ""
    };
end;
v0:setContext({
    prefix = "[{loggerName} ({level})] - "
});
v0:addSink({
    maxLevel = v0.Levels.fromString(l_result_0.level), 
    log = function(_, v4, _)
        if string.match(v4, l_result_0.pattern) then
            print(v4);
        end;
    end
});
return v0;
