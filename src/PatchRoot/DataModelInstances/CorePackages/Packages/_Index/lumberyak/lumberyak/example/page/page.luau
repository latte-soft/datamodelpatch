local v0 = require(script.Parent.pageLogger);
local v1 = require(script.Parent.component);
return {
    init = function(v2)
        v0:setParent(v2);
    end, 
    doSomething = function()
        v0:info("calling {root} {foo}");
        return v1();
    end
};
