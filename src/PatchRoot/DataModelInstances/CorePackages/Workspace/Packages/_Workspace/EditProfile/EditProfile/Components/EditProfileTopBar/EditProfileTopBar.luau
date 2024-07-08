local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_HeaderBar_0 = require(l_Parent_0.UIBlox).App.Bar.HeaderBar;
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
return function(v9)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        LayoutOrder = v9.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v2.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = l_useLocalization_0({
                title = v5.Title
            }).title, 
            backgroundTransparency = 1, 
            barHeight = 48, 
            renderLeft = if not l_GetFFlagUIBloxUseNewHeaderBar_0() then l_HeaderBar_0.renderLeft.backButton(v9.onClose) else l_makeBackButton_0(v9.onClose)
        })
    });
end;
