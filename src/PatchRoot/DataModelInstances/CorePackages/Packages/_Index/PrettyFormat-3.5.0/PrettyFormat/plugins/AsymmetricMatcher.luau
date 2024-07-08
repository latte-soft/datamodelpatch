local l_Parent_0 = script.Parent.Parent;
local l_Symbol_0 = require(l_Parent_0.Parent.LuauPolyfill).Symbol;
local v2 = require(l_Parent_0.Collections);
local l_printListItems_0 = v2.printListItems;
local l_printTableEntries_0 = v2.printTableEntries;
local _ = require(l_Parent_0.Types);
local v6 = l_Symbol_0.for_("jest.asymmetricMatcher");
local function _(v7)
    return v7:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1");
end;
return {
    serialize = function(v9, v10, v11, v12, v13, v14)
        local v15 = v9:toString();
        if not (v15 ~= "ArrayContaining") or v15 == "ArrayNotContaining" then
            v12 = v12 + 1;
            if v10.maxDepth < v12 then
                return "[" .. v15 .. "]";
            else
                return v15 .. " " .. "{" .. l_printListItems_0(v9.sample, v10, v11, v12, v13, v14) .. "}";
            end;
        elseif not (v15 ~= "ObjectContaining") or v15 == "ObjectNotContaining" then
            v12 = v12 + 1;
            if v10.maxDepth < v12 then
                return "[" .. v15 .. "]";
            else
                return v15 .. " " .. "{" .. l_printTableEntries_0(v9.sample, v10, v11, v12, v13, v14) .. "}";
            end;
        elseif not (v15 ~= "StringMatching") or v15 == "StringNotMatching" then
            return v15 .. " " .. v14(v9.sample, v10, v11, v12, v13);
        elseif not (v15 ~= "StringContaining") or v15 == "StringNotContaining" then
            return v15 .. " " .. v14(v9.sample:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1"), v10, v11, v12, v13);
        else
            if typeof(v9.toAsymmetricMatcher) ~= "function" then
                error("Asymmetric matcher does not implement toAsymmetricMatcher()");
            end;
            return v9:toAsymmetricMatcher();
        end;
    end, 
    test = function(v16)
        local v17 = false;
        if typeof(v16) == "table" then
            v17 = false;
            if v16 ~= nil then
                v17 = v16["$$typeof"] == v6;
            end;
        end;
        return v17;
    end
};
