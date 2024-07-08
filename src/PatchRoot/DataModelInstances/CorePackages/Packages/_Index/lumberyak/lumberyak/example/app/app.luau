local v0 = require(script.Parent.appLogger);
local v1 = require(script.Parent.Parent.page.page);
v0:addSink(require(script.Parent.PrintSink).new(v0.Levels.Error));
return function()
    v0:info("calling {root}");
    v1.init(v0);
    return v1.doSomething();
end;
