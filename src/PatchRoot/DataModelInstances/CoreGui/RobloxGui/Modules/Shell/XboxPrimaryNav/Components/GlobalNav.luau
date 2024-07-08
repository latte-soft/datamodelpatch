local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local l_IconTabGroup_0 = v2.App.Navigation.PrimaryNavBar.IconTabGroup;
local v5 = require(script.Parent.GlobalNavLayout);
local v6 = require(script.Parent.GlobalNavOptionGroup);
return (v1.forwardRef(function(v7, v8)
    local l_primaryTabItems_0 = v7.primaryTabItems;
    local v10 = v7.secondaryTabItems or {};
    local v11 = l_Object_0.assign({}, v7);
    v11.primaryTabItems = nil;
    v11.secondaryTabItems = nil;
    return v1.createElement(v5, l_Object_0.assign({
        ref = v8, 
        startSlot = v1.createElement(l_IconTabGroup_0, {
            items = l_primaryTabItems_0
        }), 
        endSlot = v1.createElement(v6, {
            items = v10
        })
    }, v11));
end));
