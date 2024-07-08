local v0 = {};
local v1 = require(script.Parent.Parent.connectors.UserConnector);
local l_findUserById_0 = v1.findUserById;
local l_findMe_0 = v1.findMe;
v0.default = {
    findUserById = function(_, v5)
        return l_findUserById_0(v5);
    end, 
    findMe = function(_)
        return l_findMe_0();
    end
};
return v0;
