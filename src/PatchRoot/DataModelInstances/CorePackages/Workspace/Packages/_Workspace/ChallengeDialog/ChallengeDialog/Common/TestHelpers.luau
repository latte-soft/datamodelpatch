local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.Rodux);
local v4 = v3.Store.new(function()
    return {};
end, {}, {
    v3.thunkMiddleware
});
return {
    createTreeWithProviders = function(v5, v6, v7)
        local v8 = v1.mount((v1.createFragment({
            storeProvider = v1.createElement(v2.StoreProvider, {
                store = if v7 ~= nil then v7 else v4
            }, {
                myElement = v1.createElement(v5, v6)
            })
        })));
        return v8, function()
            v1.unmount(v8);
        end;
    end
};
