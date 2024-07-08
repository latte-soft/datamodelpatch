local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingContacts);
local v4 = require(script.Reducers.ContactsReducer);
local v5 = require(script.Selectors);
return {
    config = function(v6)
        v6 = v1.join(v6, {
            networkingContacts = v3.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function()
                return v4(v6);
            end, 
            Selectors = v5(v6), 
            Models = require(script.Models), 
            Actions = require(script.Actions)
        };
    end
};
