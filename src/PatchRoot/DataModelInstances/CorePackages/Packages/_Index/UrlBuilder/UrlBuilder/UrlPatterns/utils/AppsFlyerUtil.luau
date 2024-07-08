local v11 = {
    replaceNewlines = function(v0, v1)
        v1 = v1 or " ";
        return v0:gsub("\r\n", v1):gsub("\r", v1):gsub("\n", v1);
    end, 
    truncateLength = function(v2, v3)
        v3 = v3 or 140;
        if v2:len() <= v3 then
            return v2;
        else
            local v4 = "";
            local v5 = ("..."):len();
            for v6, v7 in utf8.graphemes(v2) do
                local v8 = v2:sub(v6, v7);
                if not (v3 < (v4:len() + v8:len()) + v5) then
                    v4 = v4 .. v8;
                else
                    break;
                end;
            end;
            local v9, v10 = v4:gsub("%s+%S-$", "...", 1);
            if v10 > 0 then
                return v9;
            else
                return v4 .. "...";
            end;
        end;
    end
};
v11.sanitizeDescription = function(v12)
    return (v11.truncateLength((v11.replaceNewlines(v12))));
end;
return v11;
