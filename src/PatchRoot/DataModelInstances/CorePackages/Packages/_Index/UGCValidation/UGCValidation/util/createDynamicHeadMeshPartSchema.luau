local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.createIndividualBodyPartSchema);
return function(v3)
    local v4 = v2(Enum.AssetType.DynamicHead, "Head", v3);
    table.insert(v4._children, {
        Name = {
            "FaceControls"
        }, 
        ClassName = "FaceControls"
    });
    return v4;
end;
