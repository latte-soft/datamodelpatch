local v0 = require(script.Parent.Parent.Lumberyak);
local l_Logger_0 = v0.Logger;
local v5 = {
    maxLevel = l_Logger_0.Levels.Info, 
    log = function(_, v3, v4)
        if not (v4.level ~= l_Logger_0.Levels.Error) or v4.level == l_Logger_0.Levels.Warning then
            warn(v3);
            return ;
        else
            print(v3);
            return ;
        end;
    end
};
local function _(v6)
    local v7 = v0.Logger.new(nil, v6);
    v7:setContext({
        prefix = "[{loggerName} - {level}] - "
    });
    v7:addSink(v5);
    return v7;
end;
local v9 = v0.Logger.new(nil, "UIBlox");
v9:setContext({
    prefix = "[{loggerName} - {level}] - "
});
v9:addSink(v5);
local l_v9_0 = v9;
v9 = {
    uibloxSink = v5, 
    setLogLevel = function(v11, v12)
        v11.uibloxSink.maxLevel = v12;
        v11:addSink(v11.uibloxSink);
    end, 
    enableTraceLog = function(v13)
        v13:setLogLevel(l_Logger_0.Levels.Trace);
    end
};
setmetatable(v9, {
    __index = l_v9_0
});
return v9;
