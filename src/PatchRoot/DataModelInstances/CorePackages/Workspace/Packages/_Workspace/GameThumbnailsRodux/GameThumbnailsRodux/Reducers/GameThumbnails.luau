local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameThumbnailsRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.Actions.SetGameThumbnails);
return function(v3, v4)
    v3 = v3 or {};
    assert(v3, "");
    if v4.type == v2.name then
        local v5 = {};
        for v6, v7 in pairs(v4.thumbnails) do
            v5[v6] = v7.url;
        end;
        v3 = l_Immutable_0.JoinDictionaries(v3, v5);
    end;
    return v3;
end;
