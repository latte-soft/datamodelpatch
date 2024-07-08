local l_Parent_0 = script.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.Parent.LuauPolyfill).Boolean;
local v2 = {};
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
v2.checkFetcher = function(v4)
    if not l_Boolean_0.toJSBoolean(v4) and typeof(_G.fetch) == "nil" then
        error(l_InvariantError_0.new("\n\"fetch\" has not been found globally and no fetcher has been configured. To fix this, install a fetch package (like https://www.npmjs.com/package/cross-fetch), instantiate the fetcher, and pass it into your HttpLink constructor. For example:\n\nimport fetch from 'cross-fetch';\nimport { ApolloClient, HttpLink } from '@apollo/client';\nconst client = new ApolloClient({\n  link: new HttpLink({ uri: '/graphql', fetch })\n});\n    "));
    end;
end;
return v2;
