local v0 = require(script.Parent.Config);
local v1 = require(script.Parent.MotionType);
return {
    spring = function(v2, v3, v4, v5)
        return {
            type = v1.Spring, 
            value = v2, 
            stiffness = v3 or v0.DEFAULT_STIFFNESS, 
            damping = v4 or v0.DEFAULT_DAMPING, 
            precision = v5 or v0.SPRING_PRECISION
        };
    end, 
    extractValue = function(v6)
        if type(v6) == "table" then
            return v6.value;
        else
            return v6;
        end;
    end, 
    getType = function(v7)
        if type(v7) == "table" then
            return v7.type;
        else
            return v1.Instant;
        end;
    end
};
