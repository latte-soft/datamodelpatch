local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox);
return (setmetatable({
    act = function()
        v0.act(function()
            task.wait(0);
        end);
    end
}, {
    __call = function()
        task.wait(0);
    end
}));
