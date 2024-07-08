local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.SetMenuOpen);
local v3 = require(l_Parent_0.Utility.SendAnalytics);
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
local v6 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
return function(v7)
    return function(v8)
        l_GuiService_0:SetMenuIsOpen(true, "InGameMenu");
        v8:dispatch(v2(true));
        v8:dispatch(v5(v4.MainPagePageKey));
        if v8:getState().nativeClosePrompt.menuIconTooltipOpen then
            v8:dispatch(v6(false));
        end;
        v3(v4.AnalyticsMenuOpenName, v4.AnalyticsMenuActionName, {
            source = v7
        });
    end;
end;
