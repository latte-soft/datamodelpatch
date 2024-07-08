local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.RoactNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.TitleDropDown);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v12 = v4.strictInterface({
    formFactor = v4.string, 
    isCompactView = v4.boolean, 
    isUnderTitleSearchBarEnabled = v4.boolean, 
    isSearching = v4.boolean, 
    setVisible = v3.isCallable, 
    cancelSearch = v3.isCallable, 
    activateSearch = v3.isCallable, 
    buttonRef = v4.optional(v4.table), 
    navigateWithLock = v4.callback, 
    navigation = v4.table
});
return function(v13, v14)
    return (v7.withNavigation((v6.connect(nil, function(v15)
        return {
            navigateWithLock = function(v16)
                v15(v11(v16));
            end
        };
    end)(function(v17)
        v2.assert(v12(v17));
        return l_withLocalization_0({
            title = v13
        })(function(v18)
            return v5.createElement(v9, {
                Text = v18.title or "", 
                onActivated = function()
                    v17.navigateWithLock(function()
                        v17.navigation.navigate(v10.AXTransitionContextualMenu, {
                            onOverlayClosed = v14
                        });
                    end);
                end, 
                [v5.Ref] = v17.buttonRef
            });
        end);
    end))));
end;
