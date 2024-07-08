return function(v0)
    local v1 = {};
    for v2 = 1, v0.n do
        if type(v0[v2]) == "string" then
            table.insert(v1, "\"" .. v0[v2] .. "\"");
        else
            table.insert(v1, (tostring(v0[v2])));
        end;
    end;
    return "{" .. table.concat(v1, ", ") .. "}";
end;
