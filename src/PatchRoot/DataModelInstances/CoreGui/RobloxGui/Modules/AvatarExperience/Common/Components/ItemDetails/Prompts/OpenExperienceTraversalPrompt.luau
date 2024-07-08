local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_Modules_0.LuaApp.AppPage);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v20 = l_Images_0["icons/status/imageunavailable"];
return v7(function(v21)
    local l_params_0 = v21.navigation.state.params;
    local v23 = v4({
        title = "Feature.Catalog.Heading.GoToExperience", 
        body = {
            "Feature.Catalog.Description.AttributionAlertBody"; 
            experienceName = v21.navigation.state.params.gameName or ""
        }, 
        confirmButtonText = "CommonUI.Features.Action.Go", 
        cancelButtonText = "CommonUI.Controls.Action.Cancel", 
        viewDetailsButtonText = "Feature.Catalog.Action.ViewExperienceDetails"
    });
    local v25 = l_useSelector_0(function(v24)
        return v24.ScreenSize;
    end);
    local v26 = v2.useCallback(function()
        v6.closeOverlay(v21.navigation);
    end, {
        v21.navigation
    });
    local v27 = v2.useCallback(function()
        v6.closeOverlay(v21.navigation);
        l_params_0.onPlayButtonActivated();
    end, {
        v21.navigation
    });
    local v28 = v2.useCallback(function()
        v6.navigateFromOverlay(v21.navigation, v8.ExperienceDetail, {
            detail = l_params_0.gameUniverseId, 
            extraProps = {
                mountAsFullView = true
            }
        });
    end, {
        v21.navigation
    });
    local v29 = l_useStyle_0();
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local v32 = if not l_params_0.thumbnailUrl then v20 else l_params_0.thumbnailUrl;
    local v33 = if not l_params_0.thumbnailUrl then UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large) else UDim2.fromOffset(150, 150);
    local v34, v35 = v2.useState(nil);
    local v36, v37 = v2.useState(nil);
    local v38 = nil;
    if v11() then
        local v40 = l_useSelector_0(function(v39)
            return v39[l_GameIconReducer_0.key];
        end);
        v2.useEffect(function()
            if not l_params_0.thumbnailUrl then
                local v41 = v40[l_params_0.gameUniverseId];
                if v41 then
                    v35(v41.url);
                    v37(UDim2.fromOffset(150, 150));
                end;
            end;
        end, {
            v40
        });
        if l_params_0.hideConfirmationButton then
            v38 = {
                {
                    props = {
                        onActivated = v26, 
                        text = v23.cancelButtonText, 
                        layoutOrder = 0
                    }, 
                    isDefaultChild = true
                }
            };
        end;
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        title = if not not v11() and l_params_0.overrideTitle then l_params_0.overrideTitle else v23.title, 
        middleContent = function()
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                ExperienceThumbnailFrame = v2.createElement("Frame", {
                    Size = UDim2.fromOffset(150, 150), 
                    BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    ClipsDescendants = true
                }, {
                    ExperienceThumbnail = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = if not v34 then v32 else v34, 
                        Size = if not v36 then v33 else v36, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        RoundCorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }), 
                    RoundCorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                BodyText = v2.createElement(l_StyledTextLabel_0, {
                    text = if not not v11() and l_params_0.overrideBody then l_params_0.overrideBody else v23.body, 
                    fontStyle = l_Font_0.Body, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    lineHeight = 1
                }), 
                DetailsButton = v2.createElement(l_LinkButton_0, {
                    text = v23.viewDetailsButtonText, 
                    onActivated = v28, 
                    layoutOrder = 3, 
                    selectionCursorKind = l_CursorKind_0.RoundedRectNoInset
                })
            });
        end, 
        buttonStackInfo = {
            buttons = if not v38 then {
                {
                    props = {
                        onActivated = v26, 
                        text = v23.cancelButtonText, 
                        layoutOrder = 0
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v27, 
                        text = v23.confirmButtonText, 
                        layoutOrder = 2
                    }, 
                    isDefaultChild = false
                }
            } else v38
        }, 
        screenSize = v25, 
        defaultChildRef = v21.defaultChildRef, 
        isMiddleContentFocusable = true
    });
end);
