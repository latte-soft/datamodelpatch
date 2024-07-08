local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.InGameMenuPolicy);
local v5 = require(script.Parent.ViewportOverlay);
local v6 = require(script.Parent.SideNavigation);
local v7 = require(script.Parent.LeaveGameDialog);
local v8 = require(script.Parent.PageContainer);
local v9 = require(script.Parent.RespawnDialog);
local v10 = require(script.Parent.ReportPage.ReportDialog);
local v11 = require(script.Parent.ReportPage.ReportSentDialog);
local v12 = require(script.Parent.ControlsPage.ControlLayoutSetter);
local v13 = require(script.Parent.Connection);
local v14 = require(script.Parent.EducationalPopup);
local v15 = require(script.Parent.MenuIconTooltip);
local v16 = require(script.Parent.FullscreenTitleBar);
local v17 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v18 = require(l_Parent_0.Resources.Constants);
return l_RoactRodux_0.connect(function(v19, _)
    return {
        isMenuOpen = v19.isMenuOpen
    };
end, nil)((v4.connect(function(v21, _)
    return {
        enableFullscreenTitleBar = v21.enableFullscreenTitleBar(), 
        isEducationalPopupEnabled = v21.enableEducationalPopup()
    };
end)(function(v23)
    local v24 = nil;
    if v23.enableFullscreenTitleBar then
        v24 = l_Roact_0.createElement(v16, {
            displayOrder = v18.DisplayOrder.FullscreenTitleBar
        });
    end;
    if not v17 then
        return l_Roact_0.createFragment({
            Overlay = l_Roact_0.createElement(v5), 
            SideNavigation = l_Roact_0.createElement(v6), 
            LeaveGameDialog = l_Roact_0.createElement(v7), 
            PageContainer = l_Roact_0.createElement(v8), 
            RespawnDialog = l_Roact_0.createElement(v9), 
            ReportDialog = l_Roact_0.createElement(v10), 
            ReportSentDialog = l_Roact_0.createElement(v11), 
            ControlLayoutSetter = l_Roact_0.createElement(v12), 
            Connection = l_Roact_0.createElement(v13), 
            EducationalPopup = not not v23.isEducationalPopupEnabled and l_Roact_0.createElement(v14) or nil, 
            MenuIconTooltip = not not v23.isEducationalPopupEnabled and l_Roact_0.createElement(v15) or nil, 
            FullscreenTitleBar = v24
        });
    else
        return l_Roact_0.createFragment({
            Content = not not v23.isMenuOpen and l_Roact_0.createFragment({
                Overlay = l_Roact_0.createElement(v5), 
                SideNavigation = l_Roact_0.createElement(v6), 
                LeaveGameDialog = l_Roact_0.createElement(v7), 
                PageContainer = l_Roact_0.createElement(v8), 
                RespawnDialog = l_Roact_0.createElement(v9), 
                ReportDialog = l_Roact_0.createElement(v10), 
                ReportSentDialog = l_Roact_0.createElement(v11), 
                ControlLayoutSetter = l_Roact_0.createElement(v12)
            }) or nil, 
            Connection = l_Roact_0.createElement(v13), 
            EducationalPopup = not not v23.isEducationalPopupEnabled and l_Roact_0.createElement(v14) or nil, 
            MenuIconTooltip = not not v23.isEducationalPopupEnabled and l_Roact_0.createElement(v15) or nil, 
            FullscreenTitleBar = v24
        });
    end;
end)));
