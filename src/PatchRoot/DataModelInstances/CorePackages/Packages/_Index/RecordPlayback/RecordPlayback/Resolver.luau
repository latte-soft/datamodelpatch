local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Location);
local v2 = require(l_Parent_0.PathUtils);
local v3 = {};
local v4 = {
    __index = v3
};
v3.new = function(v5, v6)
    return (setmetatable({
        _parent = v5, 
        _fileSystemPath = v2.trimSeparators(v6)
    }, v4));
end;
v3.getInstance = function(v7, v8)
    return v7:getLocation(v8):getInstance();
end;
v3.getLocation = function(v9, v10)
    return v1.new(v10, v9._fileSystemPath, v9._parent);
end;
return v3;
