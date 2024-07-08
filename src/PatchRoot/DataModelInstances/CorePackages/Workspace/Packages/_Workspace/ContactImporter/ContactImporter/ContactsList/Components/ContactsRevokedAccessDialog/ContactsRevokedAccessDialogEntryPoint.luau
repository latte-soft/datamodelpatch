local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v4 = require(script.Parent.ContactsRevokedAccessDialog);
return function(v5)
    return v1.createElement(v4, v2.join(v5, {
        navigation = l_useNavigation_0()
    }));
end;
