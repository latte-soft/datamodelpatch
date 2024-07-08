local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v15 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactLocalization);
local v16 = game:DefineFastString("VngAppUpsellUrl", "https://www.roblox.com");
local v17 = game:DefineFastString("VngAppUpsellProTipTextEn", "");
local v18 = game:DefineFastString("VngAppUpsellProTipTextVn", "");
return function(v19)
    local v20 = l_useStyle_0();
    local v21 = l_useDesignTokens_0();
    local v22 = l_useLocalization_0({
        vngUpsellTitle = "CommonUI.Features.Label.VNGMigrationTitle", 
        vngUpsellBody = "CommonUI.Features.Label.VNGMigrationBody", 
        vngUpsellProtip = "CommonUI.Features.Label.VNGMigrationTip", 
        vngUpsellButtonText = "CommonUI.Features.Label.VNGMigrationGoButton"
    });
    local v23 = l_useRoactService_0(l_AppLinking_0);
    local v24 = l_useDispatch_0();
    local v26 = l_useSelector_0(function(v25)
        return v25.ScreenSize;
    end);
    local v27 = v2.useCallback(function()
        v24(l_CloseCentralOverlay_0());
    end, {});
    local l_vngUpsellProtip_0 = v22.vngUpsellProtip;
    local l_Locale_0 = l_useRoactService_0(v15):GetLocale();
    if v18 ~= "" and l_Locale_0 == "vi-vn" then
        l_vngUpsellProtip_0 = v18;
    elseif v17 ~= "" and l_Locale_0 == "en-us" then
        l_vngUpsellProtip_0 = v17;
    end;
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local l_Size_250_0 = v21.Global.Size_250;
    return v2.createElement(l_FullPageModal_0, {
        screenSize = v26, 
        title = v22.vngUpsellTitle, 
        distanceFromTop = l_l_GuiService_0_SafeZoneOffsets_0.top + l_Size_250_0, 
        onCloseClicked = if not v19.isDismissable then nil else v27, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v23:openURL(v16);
                        end, 
                        text = v22.vngUpsellButtonText
                    }
                }
            }
        }
    }, {
        ContentFrame = v2.createElement("ScrollingFrame", {
            BackgroundTransparency = v20.Theme.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = v20.Theme.BackgroundUIDefault.Color, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BorderSizePixel = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0)
        }, {
            VngIcon = v2.createElement("ImageLabel", {
                Size = UDim2.new(0, 186, 0, 186), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/icons/ic_launcher_vng_square_xxxhdpi.png", 
                Position = UDim2.new(0.5, 0, 0, l_Size_250_0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }), 
            Contents = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                Position = UDim2.new(0.5, 0, 0, (l_Size_250_0 + 186) + v21.Global.Size_400), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, l_Size_250_0)
                }), 
                BodyText = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    text = v22.vngUpsellBody, 
                    colorStyle = v20.Theme.TextEmphasis, 
                    fontStyle = v20.Font.HeadingSmall, 
                    size = UDim2.new(1, 0, 0, 0), 
                    textXAlignment = Enum.TextXAlignment.Center
                }), 
                Protip = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    text = l_vngUpsellProtip_0, 
                    colorStyle = v20.Theme.TextDefault, 
                    fontStyle = v20.Font.BodyLarge, 
                    size = UDim2.new(1, 0, 0, 0), 
                    textXAlignment = Enum.TextXAlignment.Center
                }), 
                BottomPadding = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4
                })
            })
        })
    });
end;
