local function v1(_)
end;
if _G.__DEV__ then
    v1 = function(v2)
        if v2 == nil then
            error("invariant requires an error message argument");
        end;
    end;
end;
return function(v3, v4, ...)
    v1(v4);
    if not v3 then
        if v4 == nil then
            error("Minified exception occurred; use the non-minified dev environment " .. "for the full error message and additional helpful warnings.", 2);
            return ;
        else
            error(string.format(v4, ...), 2);
        end;
    end;
end;
