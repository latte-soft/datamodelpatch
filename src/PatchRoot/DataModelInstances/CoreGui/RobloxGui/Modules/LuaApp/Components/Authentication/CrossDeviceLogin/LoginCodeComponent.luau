local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShowCodeView);
local v6 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShowProfileView);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v8 = require(l_Modules_0.LuaApp.FitChildren);
return function(v9)
    return v2.createElement(v8.FitFrame, {
        Size = UDim2.new(1, 0, 0, 0), 
        fitAxis = v8.FitAxis.Height, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = if not v9.isDualLayout then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 12)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = if not v9.isDualLayout then UDim.new(0, 24) else UDim.new(0, 0), 
            PaddingBottom = if not v9.isDualLayout then UDim.new(0, 12) else UDim.new(0, 0), 
            PaddingLeft = if not v9.isDualLayout then nil else UDim.new(0, l_useDesignTokens_0().LuaApps.LoginView.dualLayoutPadding)
        }), 
        View = not not v9.showCodeView and v2.createElement(v5, {
            DeviceCode = v9.DeviceCode, 
            QrCodeUrl = if not v4() then nil else v9.QrCodeUrl, 
            AltTitle = v9.AltTitle, 
            AltInstruction = v9.AltInstruction, 
            AltMobileInstruction = v9.AltMobileInstruction, 
            AltDesktopInstruction = v9.AltDesktopInstruction, 
            DisableQrCode = v9.disableCdlQrCodeForMaquettes or false, 
            hideDeviceCode = v9.hideDeviceCode, 
            showLockIcon = v9.showLockIcon, 
            isDualLayout = v9.isDualLayout, 
            leftAlignText = v9.isDualLayout, 
            showConfirmLoginText = v9.showConfirmLoginText, 
            DisplayName = v9.DisplayName
        }) or v2.createElement(v6, {
            Url = v9.AccountPictureUrl, 
            DisplayName = v9.DisplayName, 
            leftAlignText = v9.isDualLayout
        })
    });
end;
