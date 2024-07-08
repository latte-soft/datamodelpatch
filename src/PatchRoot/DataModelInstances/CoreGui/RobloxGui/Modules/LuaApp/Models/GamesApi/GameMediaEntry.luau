local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = {};
for v6, v7 in pairs(v3.GameMediaImageType) do
    v5[v7] = v6;
end;
local v8 = {
    new = function()
        return {};
    end
};
v8.fromJsonData = function(v9)
    local v10 = v8.new();
    v10.id = v9.id and tostring(v4.isType(v9.id, "number", "jsonData.id"));
    v10.assetTypeId = v4.isType(v9.assetTypeId, "number", "jsonData.assetTypeId");
    v10.imageId = v9.imageId and tostring(v4.isType(v9.imageId, "number", "jsonData.imageId"));
    v10.videoHash = v9.videoHash and v4.isType(v9.videoHash, "string", "jsonData.videoHash");
    v10.videoTitle = v9.videoTitle and v4.isType(v9.videoTitle, "string", "jsonData.videoTitle");
    v10.approved = v4.isType(v9.approved, "boolean", "jsonData.approved");
    if not v5[v10.assetTypeId] then
        v2.warn("Unrecognized assetTypeId: " .. tostring(v10.assetTypeId));
    end;
    return v10;
end;
return v8;
