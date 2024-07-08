local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Parent_1 = l_Parent_0.Parent;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v8 = require(l_Parent_0.Analytics);
local v9 = require(l_Parent_1.BackpackScript);
local v10 = require(l_Actions_0.ShowMenu);
local v11 = v8.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0));
return function(_)
    return function(v13)
        if l_GuiService_0.MenuIsOpen then
            if not l_VRService_0.VREnabled then
                return ;
            else
                l_GuiService_0:SetMenuIsOpen(false, "VRMenu");
            end;
        end;
        if v9.IsOpen then
            v9.OpenClose();
        end;
        if not v9.IsOpen then
            v11:onMenuOpened();
            v13:dispatch(v10());
            return ;
        else
            return ;
        end;
    end;
end;
