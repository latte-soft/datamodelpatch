local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.MagicMock);
local v2 = require(l_Parent_0.Spy);
local v3 = require(l_Parent_0.AnyCallMatches);
local v4 = require(l_Parent_0.fmtArgs);
local v5 = require(l_Parent_0.symbols);
local function _(v6)
    return function(v7)
        return v7 == v6;
    end;
end;
local function _(v9)
    if not (type(v9) == "table") or not v9[v5.isPredicate] then
        return ;
    else
        return not v1.is(v9);
    end;
end;
return function(v11, ...)
    if v1.is(v11) or v2.is(v11) then
        local v12 = table.pack(...);
        local v13 = {};
        for _, v15 in ipairs(v12) do
            if not if type(v15) == "table" and v15[v5.isPredicate] then not v1.is(v15) else nil then
                table.insert(v13, function(v16)
                    return v16 == v15;
                end);
            else
                table.insert(v13, v15.predicate);
            end;
        end;
        local v17, v18 = v3.predicates(v11, table.unpack(v13));
        return {
            pass = v17, 
            message = not not v17 and string.format("Expected %s to never have been called with args: %s", tostring(v11), v4(v12)) or string.format("Expected %s to have been called with args: %s", tostring(v11), v18)
        };
    else
        return {
            pass = false, 
            message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", (tostring(v11)))
        };
    end;
end;
