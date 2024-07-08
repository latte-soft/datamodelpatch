local l_llama_0 = require(script:FindFirstAncestor("SocialTab").dependencies).llama;
return function(...)
    local v1 = {
        ...
    };
    return function(v2)
        return l_llama_0.List.reduceRight(v1, function(v3, v4)
            return v4(v3);
        end, v2);
    end;
end;
