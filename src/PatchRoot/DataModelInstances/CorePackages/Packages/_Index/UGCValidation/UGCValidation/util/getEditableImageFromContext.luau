local _ = require(script.Parent.Parent.util.Types);
return function(v1, v2, v3)
    if not v3.editableImages then
        if not v3.isServer then
            return false;
        else
            error(string.format("Failed to load texture data"));
        end;
    end;
    local v4 = v3.editableImages[v1];
    assert(v4);
    local v5 = v4[v2];
    if not (v5 and v5.instance) then
        if not v3.isServer then
            return false;
        else
            error(string.format("Failed to load texture data"));
        end;
    end;
    return true, v5.instance;
end;
