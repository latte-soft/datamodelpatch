local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v5 = require(l_Parent_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Components.MenuButton);
local v7 = require(l_Parent_0.Analytics.useAnalytics);
return function(v8)
    local v9 = v7();
    return v3.createElement(v6, {
        buttonHeight = v8.buttonHeight, 
        LayoutOrder = v8.LayoutOrder, 
        onActivated = v3.useCallback(function()
            v9.fireEvent(v5.CapturesShowMoreInGameMenu);
            v8.onActivated();
        end, {
            v8.onActivated
        }), 
        text = l_useLocalization_0({
            showMore = "Feature.Avatar.Action.ShowMore"
        }).showMore
    });
end;
