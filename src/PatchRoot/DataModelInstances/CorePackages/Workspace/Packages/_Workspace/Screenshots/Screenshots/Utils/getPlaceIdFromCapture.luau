local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getCaptureMetadata);
local _ = require(l_Parent_0.Types);
return function(v3)
    local v4 = v1(v3);
    if not v4 then
        return nil;
    else
        return v4.placeId;
    end;
end;
