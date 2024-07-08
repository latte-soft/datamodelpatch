local l_Context_0 = require(script:FindFirstAncestor("Profile").dependencies).SocialLibraries.Context;
local v1 = require(script.Context);
return {
    Context = v1, 
    Provider = v1.Provider, 
    Consumer = v1.Consumer, 
    with = l_Context_0.getWith(v1), 
    connect = l_Context_0.getConnect(v1)
};
