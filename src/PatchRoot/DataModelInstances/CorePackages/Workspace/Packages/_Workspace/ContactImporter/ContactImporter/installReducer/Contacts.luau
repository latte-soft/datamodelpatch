local v0 = require(script.Parent.Parent.dependencies);
local l_RoduxContacts_0 = v0.RoduxContacts;
local l_llama_0 = v0.llama;
local v3 = l_RoduxContacts_0.installReducer();
return function(v4, v5)
    return l_llama_0.List.reduce({
        v5
    }, v3, v4);
end;
