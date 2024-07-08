local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Dash);
local l_RoduxNetworking_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoduxNetworking;
local l_NetworkingContacts_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingContacts;
local v4 = require(script.Reducers.ContactsReducer);
local v5 = require(script.Selectors);
return {
    config = function(v6)
        v6 = v1.join(v6, {
            networkingContacts = l_NetworkingContacts_0.config({
                roduxNetworking = l_RoduxNetworking_0.mock()
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
