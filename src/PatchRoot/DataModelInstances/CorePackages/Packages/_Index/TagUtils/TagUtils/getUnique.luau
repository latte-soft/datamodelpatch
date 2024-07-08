local v0 = require(script.Parent.getAll);
return function(...)
    local v1 = v0(...);
    local v2 = #v1;
    if v2 == 1 then
        return v1[1];
    else
        if v2 == 0 then
            error(("unable to find instance tagged with %s"):format(table.concat({
                ...
            }, ", ")));
        end;
        error(("expected to find only one instance tagged with %s, but found %d"):format(table.concat({
            ...
        }, ", "), #v1));
        return ;
    end;
end;
