local l_llama_0 = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama;
return function(v1, v2, v3)
    return function(v4, v5)
        v4 = v4 or v3;
        local v6 = {
            v5
        };
        local v7 = v2[v5.type];
        if v7 then
            v6 = v7(v5);
        end;
        return l_llama_0.List.reduce(v6, v1, v4);
    end;
end;
