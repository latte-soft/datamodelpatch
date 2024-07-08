local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
return {
    didYouMean = function(v1, v2)
        local v3 = nil;
        local v4 = nil;
        if not v2 then
            v4 = v1;
        else
            v3 = v1;
            v4 = v2;
        end;
        local v5 = " Did you mean ";
        if v3 then
            v5 = v5 .. v3 .. " ";
        end;
        local v6 = {};
        for v7 = 1, #v4 do
            v6[v7] = ("%q"):format(v4[v7]);
        end;
        local v8 = #v6;
        if v8 == 0 then
            return "";
        elseif v8 == 1 then
            return v5 .. v6[1] .. "?";
        elseif v8 == 2 then
            return v5 .. v6[1] .. " or " .. v6[2] .. "?";
        else
            local v9 = {};
            table.move(v6, 1, 5, 1, v9);
            return v5 .. table.concat(v9, ", ") .. ", or " .. tostring((table.remove(v9))) .. "?";
        end;
    end
};
