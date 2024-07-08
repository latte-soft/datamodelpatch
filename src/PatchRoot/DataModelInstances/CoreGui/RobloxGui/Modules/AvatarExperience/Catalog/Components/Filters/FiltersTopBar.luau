local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v18 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v18 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
end;
local v19 = l_Images_0["icons/navigation/close"];
local v20 = not v18 and 0 or 0.5;
return function(v21)
    return v4.createElement("Frame", {
        Active = true, 
        Size = UDim2.new(1, 0, 0, (l_useSelector_0(v15.getTopBarHeightAvatarScene))), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        TouchFriendlyNavigationButton = v4.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, v20), 
            Position = UDim2.new(0, 15, v20, (l_useSelector_0(function(v22)
                return v22.TopBar.statusBarHeight;
            end))), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v4.Event.Activated] = v4.useCallback(function()
                v21.closePeekViewSignal:fire();
            end, {
                l_useNavigation_0(), 
                v21.closePeekViewSignal
            }), 
            ref = v21.buttonRef, 
            NextSelectionLeft = v21.NextSelectionLeft, 
            NextSelectionRight = v21.NextSelectionRight, 
            NextSelectionUp = v21.NextSelectionUp, 
            NextSelectionDown = v21.NextSelectionDown, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset)
        }, {
            CloseButton = v4.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v19, 
                ImageColor3 = Color3.new(1, 1, 1)
            })
        })
    });
end;
