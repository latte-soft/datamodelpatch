local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = {};
local _ = require(l_Parent_0.JestTypes);
local v3 = require(l_Parent_0.Expect);
local v4 = require(l_Parent_0.JestSnapshot);
local l_addSerializer_0 = v4.addSerializer;
local l_toMatchSnapshot_0 = v4.toMatchSnapshot;
local l_toThrowErrorMatchingSnapshot_0 = v4.toThrowErrorMatchingSnapshot;
v1.default = function(v8)
    v3.setState({
        expand = v8.expand
    });
    v3.extend({
        toMatchSnapshot = l_toMatchSnapshot_0, 
        toThrowErrorMatchingSnapshot = l_toThrowErrorMatchingSnapshot_0
    });
    v3.addSnapshotSerializer = l_addSerializer_0;
    return v3;
end;
return v1;
