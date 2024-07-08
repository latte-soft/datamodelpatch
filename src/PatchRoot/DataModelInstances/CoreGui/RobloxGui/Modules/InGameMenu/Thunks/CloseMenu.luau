local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.SetMenuOpen);
local v3 = require(l_Parent_0.Utility.SendAnalytics);
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
return function(v6)
    l_GuiService_0:SetMenuIsOpen(false, "InGameMenu");
    l_GuiService_0.SelectedCoreObject = nil;
    v6:dispatch(v2(false));
    v6:dispatch(v5(v4.InitalPageKey));
    v3(v4.AnalyticsMenuCloseName, v4.AnalyticsMenuActionName, {});
end;
