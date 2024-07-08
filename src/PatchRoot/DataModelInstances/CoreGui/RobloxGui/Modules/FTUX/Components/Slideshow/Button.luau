local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Resources.FTUXSlideshowData);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local _ = require(l_Parent_0.Enums.PlatformEnum);
local v10 = require(l_Parent_0.Enums.ButtonEnum);
return function(v11)
    local l_Font_0 = l_useStyle_0().Font;
    local v13 = v7[v11.platform];
    local l_currentIndex_0 = v11.currentIndex;
    local l_increaseCurrentIndex_0 = v11.increaseCurrentIndex;
    local l_button_0 = v13[l_currentIndex_0].button;
    return l_withLocalization_0({
        skip = "CoreScripts.VRFTUX.Action.Skip", 
        next = "CoreScripts.VRFTUX.Action.Next"
    })(function(v17)
        local l_Secondary_0 = l_ButtonType_0.Secondary;
        local l_skip_0 = v17.skip;
        if l_button_0 == v10.NextButton then
            l_Secondary_0 = l_ButtonType_0.PrimaryContextual;
            l_skip_0 = v17.next;
        end;
        return v1.createElement(l_Button_0, {
            buttonType = l_Secondary_0, 
            text = l_skip_0, 
            fontStyle = l_Font_0.Body, 
            layoutOrder = 4, 
            size = UDim2.new(1, 0, 0.6, 0), 
            onActivated = l_increaseCurrentIndex_0
        });
    end);
end;
