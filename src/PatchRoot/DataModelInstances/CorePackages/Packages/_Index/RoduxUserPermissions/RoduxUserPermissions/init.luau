local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingUserSettings);
local v4 = require(l_Parent_0.NetworkingAccountInformation);
local v5 = require(script.Reducers.UserPermissionsReducer);
return {
    config = function(v6)
        v6 = v1.join(v6, {
            networkingUserSettings = v3.config({
                roduxNetworking = v2.mock()
            }), 
            networkingAccountInformation = v4.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function()
                return v5(v6);
            end
        };
    end
};
