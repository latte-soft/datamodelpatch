local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_Modules_0.LuaApp.withLocalization);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_getIconSizeUDim2_0 = v5.App.ImageSet.getIconSizeUDim2;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_LoadingSpinner_0 = v5.App.Loading.LoadingSpinner;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v14 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
local v15 = l_Images_0["icons/graphic/devices_xxlarge"];
local v16 = v6.interface({
    DeviceCode = v6.string, 
    ShortLink = v6.string
});
return function(v17)
    assert(v16(v17));
    local v18 = l_useDesignTokens_0();
    local l_LoginView_0 = v18.LuaApps.LoginView;
    local v20 = l_useStyle_0();
    local l_DeviceCode_0 = v17.DeviceCode;
    local _ = v17.ShortLink;
    local l_TextEmphasis_0 = v20.Theme.TextEmphasis;
    local l_TextMuted_0 = v20.Theme.TextMuted;
    local l_IconDefault_0 = v20.Theme.IconDefault;
    local v26 = l_useLocalization_0({
        goToText = "Authentication.CrossDevice.GoToInstruction", 
        enterCodeInstruction = "Authentication.CrossDevice.EnterCodeInstruction"
    });
    local l_createElement_0 = v2.createElement;
    local v28 = "Frame";
    local v29 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v30 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_LoginView_0.quickLinkCodeViewTopPadding), 
            PaddingBottom = UDim.new(0, l_LoginView_0.quickLinkCodeViewBottomPadding)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 0)
        }), 
        DeviceIcon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v14, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Image = v15, 
            ImageColor3 = l_IconDefault_0.Color, 
            ImageTransparency = l_IconDefault_0.Transparency
        }), 
        InstructionsPadding = v2.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4)
        }), 
        InstructionTextGroup = v2.createElement("Frame", {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            GotToDeviceText = v2.createElement("TextLabel", {
                Text = v26.goToText, 
                Font = v18.Semantic.Typography.Subheader.Font, 
                RichText = false, 
                TextSize = v18.Semantic.Typography.Subheader.FontSize, 
                TextColor3 = l_TextMuted_0.Color, 
                TextTransparency = l_TextMuted_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = nil, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            LinkText = v2.createElement("TextLabel", {
                Text = v17.ShortLink, 
                RichText = true, 
                Font = v18.Semantic.Typography.Title.Font, 
                TextSize = v18.Semantic.Typography.Title.FontSize, 
                TextColor3 = l_TextEmphasis_0.Color, 
                TextTransparency = l_TextEmphasis_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = nil, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        QuickLoginCodePadding = v2.createElement("Frame", {
            LayoutOrder = 4, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 8)
        })
    };
    local l_createElement_1 = v2.createElement;
    local v32 = "Frame";
    local v33 = {
        LayoutOrder = 5, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v34 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        GoToCodeText = v2.createElement("TextLabel", {
            Text = v26.enterCodeInstruction, 
            Font = v18.Semantic.Typography.Body.Font, 
            RichText = false, 
            TextSize = v18.Semantic.Typography.Body.FontSize, 
            TextColor3 = l_TextMuted_0.Color, 
            TextTransparency = l_TextMuted_0.Transparency, 
            TextWrapped = true, 
            TextXAlignment = nil, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        CodeDisplayPadding = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 8), 
            LayoutOrder = 2
        })
    };
    local l_createElement_2 = v2.createElement;
    local v36 = "TextLabel";
    local v37 = {
        LayoutOrder = 3, 
        Text = l_DeviceCode_0, 
        Font = v18.Semantic.Typography.Title.Font, 
        TextSize = v18.Semantic.Typography.Title.FontSize, 
        TextColor3 = l_TextEmphasis_0.Color, 
        TextTransparency = l_TextEmphasis_0.Transparency, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.7, 
        TextXAlignment = nil, 
        Size = UDim2.new(0, v18.Semantic.Typography.Title.FontSize * 6, 0, v18.Semantic.Typography.Title.FontSize * 1.5)
    };
    local v38 = {};
    local v39 = false;
    if l_DeviceCode_0 == "" then
        v39 = v2.createElement(l_LoadingSpinner_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            size = UDim2.new(0, l_LoginView_0.quickLinkCodeViewCodeTextSize * 1.5, 0, l_LoginView_0.quickLinkCodeViewCodeTextSize * 1.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
    v38.Spinner = v39;
    v38.UICorner = v2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 8)
    });
    v38.UIPadding = v2.createElement("UIPadding", {
        PaddingLeft = UDim.new(l_LoginView_0.quickLinkCodeViewCodeBoxHorizontalPadding, 0), 
        PaddingRight = UDim.new(l_LoginView_0.quickLinkCodeViewCodeBoxHorizontalPadding, 0), 
        PaddingTop = UDim.new(0, l_LoginView_0.quickLinkCodeViewCodeBoxVertialPaddingb), 
        PaddingBottom = UDim.new(0, l_LoginView_0.quickLinkCodeViewCodeBoxVertialPaddingb)
    });
    v34.CodeDisplay = l_createElement_2(v36, v37, v38);
    v30.QuickLoginCodeGroup = l_createElement_1(v32, v33, v34);
    return l_createElement_0(v28, v29, v30);
end;
