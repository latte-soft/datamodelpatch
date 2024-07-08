local function v0(v1)
    if v1.routes and #v1.routes > 1 then
        return false;
    else
        local v2 = v1.routes and v1.routes[v1.index];
        if not v2 then
            return true;
        else
            return v0(v2);
        end;
    end;
end;
return v0;
