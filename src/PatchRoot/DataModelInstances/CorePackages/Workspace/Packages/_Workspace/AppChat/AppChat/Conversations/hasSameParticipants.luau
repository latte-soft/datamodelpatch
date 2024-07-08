local l_llama_0 = require(script:FindFirstAncestor("AppChat").Parent.LuaSocialLibrariesDeps).llama;
return function(v1)
    if #v1.existing ~= #v1.new then
        return false;
    else
        return l_llama_0.List.equals(l_llama_0.List.sort(v1.existing), (l_llama_0.List.sort(v1.new)));
    end;
end;
