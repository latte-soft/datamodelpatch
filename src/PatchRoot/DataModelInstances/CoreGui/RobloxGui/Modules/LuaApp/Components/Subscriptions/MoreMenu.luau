local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v4 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
return function(v9)
    local l_Semantic_0 = l_useDesignTokens_0().Semantic;
    local l_Medium_0 = l_Semantic_0.Icon.Size.Medium;
    return v2.createElement(l_ImageSetButton_0, {
        Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
        AnchorPoint = Vector2.new(0.25, 0.75), 
        Position = UDim2.fromScale(1, 0), 
        Image = l_Images_0["icons/common/overflow"], 
        ImageColor3 = l_Semantic_0.Color.Icon.Emphasis.Color3, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        [v2.Event.Activated] = v9.onActivated
    }, {
        Menu = v2.createElement("Frame", {
            BackgroundTransparency = 1
        }, {
            ContextualMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v9.buttonProps, 
                screenSize = v9.screenSize, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, l_Medium_0), 
                openPositionX = UDim.new(0, -100), 
                open = v9.showMenu, 
                onDismiss = v9.onDismiss, 
                elementHeight = 38, 
                closeBackgroundVisible = false, 
                contextMenuWidthOverride = UDim.new(0, 155)
            })
        })
    });
end;
