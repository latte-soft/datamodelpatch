local v0 = {};
local v1 = require(script.Parent.Parent.connectors.UserConnector);
local l_findUserById_0 = v1.findUserById;
local l_findMe_0 = v1.findMe;
v0.default = {
    User = {
        __resolveType = function()
            return "Player";
        end
    }, 
    Query = {
        me = function(_, _, v6)
            return l_findMe_0(v6.fetchImpl);
        end, 
        user = function(_, v8, v9)
            return l_findUserById_0(v8.id, v9.fetchImpl);
        end
    }
};
return v0;
