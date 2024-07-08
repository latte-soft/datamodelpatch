local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local _ = require(script.Parent.Parent.language.ast);
concatAST = function(v2)
    local v3 = {};
    for _, v5 in ipairs(v2) do
        v3 = l_Array_0.concat(v3, v5.definitions);
    end;
    return {
        kind = "Document", 
        definitions = v3
    };
end;
return {
    concatAST = concatAST
};
