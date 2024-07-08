local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script:FindFirstAncestor("ContactList").Context.ContactListContext);
return function()
    return {
        fireEvent = v0.useContext(v1).fireAnalyticsEvent
    };
end;
