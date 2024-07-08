local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.UIBlox);
local _ = v8.App.ImageSet.Images;
local _ = v8.App.Constant.IconSize;
local l_withStyle_0 = v8.Style.withStyle;
local l_Toast_0 = v8.App.Dialog.Toast;
local v13 = "F11";
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v13 = "Ctrl + Command + F";
end;
return function(_)
    return v4({
        titleText = "CommonUI.Messages.Label.ToExitFullscreen"
    })(function(v15)
        return l_withStyle_0(function(v16)
            local l_Footer_0 = v16.Font.Footer;
            local _ = v16.Theme.TextEmphasis;
            local _ = l_Footer_0.RelativeSize * v16.Font.BaseSize;
            return v7.createElement(v7.Portal, {
                target = l_CoreGui_0
            }, {
                ExitFullscreenToastScreen = v7.createElement(v6, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = v5.DisplayOrder.Toast
                }, {
                    Toast = v7.createElement(l_Toast_0, {
                        duration = 3, 
                        toastContent = {
                            toastTitle = v13, 
                            toastSubtitle = v15.titleText
                        }
                    })
                })
            });
        end);
    end);
end;
