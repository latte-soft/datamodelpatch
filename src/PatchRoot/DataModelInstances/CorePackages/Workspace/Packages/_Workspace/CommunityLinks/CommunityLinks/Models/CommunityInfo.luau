local v0 = require(script.Parent.Parent.Enums.CommunityVisibility);
local v1 = {
    new = function()
        return {
            communityId = "", 
            name = "", 
            description = "", 
            visibility = v0.Private
        };
    end
};
v1.mock = function(v2)
    v2 = v2 or {};
    local v3 = v1.new();
    v3.communityId = v2.communityId or "abcd" .. tostring(math.random(1000, 9999));
    v3.name = v2.name or "my community";
    v3.description = v2.description or "description of the community";
    v3.visibility = v2.visibility or v0.Public;
    return v3;
end;
v1.fromJsonData = function(v4)
    local v5 = v1.new();
    v5.communityId = v4.communityId;
    v5.name = v4.name;
    v5.description = v4.description;
    v5.visibility = v4.visibility;
    return v5;
end;
return v1;
