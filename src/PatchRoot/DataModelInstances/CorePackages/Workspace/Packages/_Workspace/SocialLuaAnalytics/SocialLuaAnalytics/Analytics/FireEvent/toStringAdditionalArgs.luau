local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_tutils_0 = v0.tutils;
local l_llama_0 = v0.llama;
return function(v3)
    if not l_llama_0.isEmpty(v3) then
        local v4, _ = string.gsub(" args: " .. l_tutils_0.toString(v3), "%s+", " ");
        return v4;
    else
        return "{}";
    end;
end;
