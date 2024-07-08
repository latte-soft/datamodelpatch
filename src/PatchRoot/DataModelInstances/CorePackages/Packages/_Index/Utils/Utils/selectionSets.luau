local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local l_parse_0 = require(l_Parent_0.GraphQL).parse;
local _ = require(script.Parent.Interfaces);
v1.parseSelectionSet = function(v4, v5)
    return l_parse_0(v4, v5).definitions[1].selectionSet;
end;
return v1;
