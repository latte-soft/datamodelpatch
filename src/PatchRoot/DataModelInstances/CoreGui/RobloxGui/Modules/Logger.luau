local v0 = require(game:GetService("CorePackages").Lumberyak).Logger.new(nil, "CoreLogger");
local v1 = v0.Levels.fromString((game:DefineFastString("DebugLuaLogLevel", "")));
local v2 = game:DefineFastString("DebugLuaLogPattern", "");
v0:setContext({
    prefix = "[{loggerName}] - "
});
v0:addSink({
    maxLevel = v1, 
    log = function(_, v4, _)
        if string.match(v4, v2) then
            print(v4);
        end;
    end
});
return v0;
