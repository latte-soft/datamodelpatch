local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.createIndividualBodyPartSchema);
return function(v4, v5, v6)
    local v7 = v1.ASSET_TYPE_INFO[v4];
    local v8 = {
        ClassName = "Folder", 
        Name = {
            v5
        }, 
        _children = {}
    };
    for v9 in pairs(v7.subParts) do
        table.insert(v8._children, (v3(v4, v9, v6)));
    end;
    return v8;
end;
