local l_Parent_0 = script.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.Expect);
local v3 = require(l_Parent_0.Jest);
local v4 = require(l_Parent_0.JestSnapshot);
local v5 = require(l_Parent_0.TestEZ);
return {
    expect = v2, 
    jest = v3, 
    testEnv = v3.testEnv, 
    jestSnapshot = {
        toMatchSnapshot = v4.toMatchSnapshot, 
        toThrowErrorMatchingSnapshot = v4.toThrowErrorMatchingSnapshot
    }, 
    TestEZ = l_Object_0.assign({}, v5, {
        Reporters = l_Object_0.assign({}, v5.Reporters, require(l_Parent_0.TestEZJestAdapter).Reporters)
    })
};
