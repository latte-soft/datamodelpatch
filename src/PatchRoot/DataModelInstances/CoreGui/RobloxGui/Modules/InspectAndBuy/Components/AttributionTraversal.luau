local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.Common.Hooks.useScreenSize);
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local v14 = require(script.Parent.Parent.Actions.CloseOverlay);
return function(v15)
    local v16 = l_useDispatch_0();
    local v17 = v12();
    local v18 = l_useStyle_0();
    local v19 = v3.useCallback(function()
        v16(v14());
    end, {
        v16
    });
    local v20 = v3.useCallback(function()
        l_ExperienceService_0:LaunchExperience({
            placeId = v15.rootPlaceId
        });
        v16(v14());
    end, {
        v16, 
        v15.rootPlaceId
    });
    local v22 = l_useSelector_0(function(v21)
        return v21.locale;
    end);
    local l_Theme_0 = v18.Theme;
    local l_Font_0 = v18.Font;
    local v25 = v15.name or "";
    return v3.createElement(l_InteractiveAlert_0, {
        title = v11:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", v22), 
        middleContent = function()
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v18.Tokens.Global.Space_150)
                }), 
                ExperienceThumbnailFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(150, 150), 
                    BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    ClipsDescendants = true
                }, {
                    ExperienceThumbnail = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(v15.universeId), 150, 150), 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        RoundCorner = v3.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v18.Tokens.Semantic.Radius.Medium)
                        })
                    })
                }), 
                BodyText = v3.createElement(l_StyledTextLabel_0, {
                    text = v11:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", v22, {
                        EXPERIENCE_NAME = v25
                    }), 
                    fontStyle = l_Font_0.Body, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    lineHeight = 1
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v19, 
                        text = v11:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", v22), 
                        layoutOrder = 0
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v20, 
                        text = v11:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", v22), 
                        layoutOrder = 2
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        isMiddleContentFocusable = false, 
        screenSize = v17
    });
end;
