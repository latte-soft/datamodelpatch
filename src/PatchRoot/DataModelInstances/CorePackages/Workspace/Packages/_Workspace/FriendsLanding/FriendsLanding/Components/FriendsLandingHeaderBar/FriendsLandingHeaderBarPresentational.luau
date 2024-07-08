local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HeaderBar_0 = require(l_script_FirstAncestor_0.dependencies).UIBlox.App.Bar.HeaderBar;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_Parent_0.React);
return function(v7)
    if not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) then
        return v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v5.TOP_BAR_HEIGHT), 
            LayoutOrder = -1, 
            ZIndex = 2
        }, {
            headerBar = v6.createElement(l_HeaderBar_0, {
                title = v7.title, 
                barHeight = v5.TOP_BAR_HEIGHT, 
                renderLeft = v7.renderLeft, 
                renderCenter = v7.renderCenter, 
                renderRight = v7.renderRight, 
                isSecondary = v7.isSecondary, 
                shouldHideSecondaryLeftItem = v7.shouldHideSecondaryLeftItem
            })
        });
    else
        return nil;
    end;
end;
