local v0 = require(script:FindFirstAncestor("GameIconRodux").GameIcons.GameIconReducer);
return function(v1, v2)
    local v3 = v1[v0.key][v2];
    if not v3 then
        return "";
    else
        return v3.url;
    end;
end;
