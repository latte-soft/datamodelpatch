local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
return v1.makeActionCreator(script.Name, function(v3)
    return {
        payload = v3
    };
end);
