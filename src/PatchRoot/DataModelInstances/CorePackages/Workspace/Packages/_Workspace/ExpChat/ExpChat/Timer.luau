local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Promise);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        goalTime = v2
    }, v1));
end;
v1.start = function(v3)
    v3.promise = v0.delay(v3.goalTime);
    return v3.promise;
end;
v1.stop = function(v4)
    if v4.promise then
        v4.promise:cancel();
    end;
end;
return v1;
