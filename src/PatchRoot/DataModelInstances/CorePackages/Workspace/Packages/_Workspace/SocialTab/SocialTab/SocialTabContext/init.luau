local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(script.Context);
local l_Context_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Context;
return {
    Context = v1, 
    Provider = v1.Provider, 
    Consumer = v1.Consumer, 
    with = l_Context_0.getWith(v1), 
    connect = l_Context_0.getConnect(v1)
};
