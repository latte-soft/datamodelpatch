local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v1 = {
    new = function()
        return {};
    end
};
v1.mock = function()
    local v2 = v1.new();
    v2.rootPlaceId = tostring(12345);
    v2.name = "Racing Game";
    v2.thumbnailAssetId = tostring(4948327354);
    v2.coplayUsers = {
        {
            userId = tostring(4340043999), 
            userDisplayName = "Mr Mittens"
        }
    };
    return v2;
end;
v1.fromJsonData = function(v3)
    local v4 = v1.new();
    v4.rootPlaceId = tostring(v3.rootPlaceId);
    v4.name = v3.name;
    v4.thumbnailAssetId = tostring(v3.thumbnailAssetId);
    local v5 = {};
    for v6 = 1, #v3.coplayUsers do
        local v7 = v3.coplayUsers[v6];
        table.insert(v5, {
            userId = tostring(v7.userId), 
            userDisplayName = v7.userDisplayName
        });
    end;
    v4.coplayUsers = v5;
    return v0.success(v4);
end;
return v1;
