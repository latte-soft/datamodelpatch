return {
    genFuzzStrings = function(v0)
        return coroutine.wrap(function()
            local l_allowedChars_0 = v0.allowedChars;
            local l_maxLength_0 = v0.maxLength;
            local v3 = #l_allowedChars_0;
            local v4 = 0;
            for v5 = 1, l_maxLength_0 do
                v4 = v4 + v3 ^ v5;
            end;
            coroutine.yield("");
            for v6 = 0, v4 - 1 do
                local v7 = "";
                local l_v6_0 = v6;
                while l_v6_0 >= 0 do
                    local v9 = l_v6_0 % v3;
                    v7 = l_allowedChars_0[v9 + 1] .. v7;
                    l_v6_0 = (l_v6_0 - v9) / v3 - 1;
                end;
                coroutine.yield(v7);
            end;
        end);
    end
};
