local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Cryo);
return function(v1)
    local v2 = {};
    local v3 = {};
    for v4, v5 in ipairs(v1.items) do
        if not v5.isVideo then
            table.insert(v3, v0.Dictionary.join(v5, {
                originalIndex = v4
            }));
        else
            table.insert(v2, v0.Dictionary.join(v5, {
                originalIndex = v4
            }));
        end;
    end;
    local v6 = v0.List.join(v2, v3);
    local l_numberOfThumbnails_0 = v1.numberOfThumbnails;
    if l_numberOfThumbnails_0 then
        for v8 = #v6 + 1, l_numberOfThumbnails_0 do
            v6[v8] = {};
        end;
    end;
    return v6, #v2, #v3;
end;
