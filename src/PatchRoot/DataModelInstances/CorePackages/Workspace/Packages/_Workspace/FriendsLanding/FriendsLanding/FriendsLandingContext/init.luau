local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Context_0 = v0.SocialLibraries.Context;
local l_React_0 = v0.React;
local v3 = require(script.Context);
return {
    Context = v3, 
    Provider = v3.Provider, 
    Consumer = v3.Consumer, 
    with = l_Context_0.getWith(v3), 
    connect = l_Context_0.getConnect(v3), 
    useContext = function()
        return (l_React_0.useContext(v3));
    end
};
