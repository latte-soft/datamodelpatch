local v0 = {};
local l_findAvatarHeadshotById_0 = require(script.Parent.Parent.connectors.PlayerConnector).findAvatarHeadshotById;
local _ = require(script.Parent.Parent.generatedTypes);
v0.default = {
    Player = {
        avatarHeadshot = function(v3, _, v5, _)
            return l_findAvatarHeadshotById_0(v3.id, v5.fetchImpl);
        end
    }
};
return v0;
