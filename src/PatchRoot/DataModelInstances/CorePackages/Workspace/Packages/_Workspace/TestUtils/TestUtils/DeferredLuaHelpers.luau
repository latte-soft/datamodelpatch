local v0 = require(script.Parent.Parent.ReactRoblox);
local function v4(v1, v2)
    for _ = 1, v2 do
        v1(function()
            task.defer(coroutine.running());
            coroutine.yield();
        end);
    end;
end;
local function v6(v5)
    v4(v5, 1);
end;
local function v12(v7, ...)
    for v8 = 1, select("#", ...) do
        local v9 = select(v8, ...);
        if not v9:IsA("ScrollingFrame") then
            local _ = v9.AbsoluteSize.Y;
        else
            local _ = v9.AbsoluteCanvasSize.Y;
        end;
    end;
    v7(function()
        task.wait();
    end);
end;
local function v14(v13)
    v13();
end;
local function v17(v15)
    return (setmetatable({
        act = function(...)
            return v15(v0.act, ...);
        end
    }, {
        __call = function(_, ...)
            return v15(v14, ...);
        end
    }));
end;
return {
    forceUpdateGuiObject = v17(v12), 
    waitForEvents = v17(v6), 
    waitForEventsTimes = v17(v4)
};
