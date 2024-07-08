local _ = function(v0)
    return function(_, ...)
        local v2 = v0(...);
        return {
            pass = v2.pass, 
            message = function()
                return v2.message;
            end
        };
    end;
end;
local v4 = {};
local v5 = require(script.Parent.above);
local l_v5_0 = v5 --[[ copy: 3 -> 4 ]];
v4.toBeAbove = function(_, ...)
    local v8 = l_v5_0(...);
    return {
        pass = v8.pass, 
        message = function()
            return v8.message;
        end
    };
end;
v5 = require(script.Parent.alignedHorizontally);
local l_v5_1 = v5 --[[ copy: 3 -> 5 ]];
v4.toBeAlignedHorizontally = function(_, ...)
    local v11 = l_v5_1(...);
    return {
        pass = v11.pass, 
        message = function()
            return v11.message;
        end
    };
end;
v5 = require(script.Parent.alignedVertically);
local l_v5_2 = v5 --[[ copy: 3 -> 6 ]];
v4.toBeAlignedVertically = function(_, ...)
    local v14 = l_v5_2(...);
    return {
        pass = v14.pass, 
        message = function()
            return v14.message;
        end
    };
end;
v5 = require(script.Parent.below);
local l_v5_3 = v5 --[[ copy: 3 -> 7 ]];
v4.toBeBelow = function(_, ...)
    local v17 = l_v5_3(...);
    return {
        pass = v17.pass, 
        message = function()
            return v17.message;
        end
    };
end;
v5 = require(script.Parent.inside);
local l_v5_4 = v5 --[[ copy: 3 -> 8 ]];
v4.toBeInside = function(_, ...)
    local v20 = l_v5_4(...);
    return {
        pass = v20.pass, 
        message = function()
            return v20.message;
        end
    };
end;
v5 = require(script.Parent.insideAbove);
local l_v5_5 = v5 --[[ copy: 3 -> 9 ]];
v4.toBeInsideAbove = function(_, ...)
    local v23 = l_v5_5(...);
    return {
        pass = v23.pass, 
        message = function()
            return v23.message;
        end
    };
end;
v5 = require(script.Parent.insideBelow);
local l_v5_6 = v5 --[[ copy: 3 -> 10 ]];
v4.toBeInsideBelow = function(_, ...)
    local v26 = l_v5_6(...);
    return {
        pass = v26.pass, 
        message = function()
            return v26.message;
        end
    };
end;
v5 = require(script.Parent.insideLeftOf);
local l_v5_7 = v5 --[[ copy: 3 -> 11 ]];
v4.toBeInsideLeftOf = function(_, ...)
    local v29 = l_v5_7(...);
    return {
        pass = v29.pass, 
        message = function()
            return v29.message;
        end
    };
end;
v5 = require(script.Parent.insideRightOf);
local l_v5_8 = v5 --[[ copy: 3 -> 12 ]];
v4.toBeInsideRightOf = function(_, ...)
    local v32 = l_v5_8(...);
    return {
        pass = v32.pass, 
        message = function()
            return v32.message;
        end
    };
end;
v5 = require(script.Parent.leftOf);
local l_v5_9 = v5 --[[ copy: 3 -> 13 ]];
v4.toBeLeftOf = function(_, ...)
    local v35 = l_v5_9(...);
    return {
        pass = v35.pass, 
        message = function()
            return v35.message;
        end
    };
end;
v5 = require(script.Parent.rightOf);
local l_v5_10 = v5 --[[ copy: 3 -> 14 ]];
v4.toBeRightOf = function(_, ...)
    local v38 = l_v5_10(...);
    return {
        pass = v38.pass, 
        message = function()
            return v38.message;
        end
    };
end;
v5 = require(script.Parent.intersect);
v4.toIntersect = function(_, ...)
    local v40 = v5(...);
    return {
        pass = v40.pass, 
        message = function()
            return v40.message;
        end
    };
end;
return v4;
