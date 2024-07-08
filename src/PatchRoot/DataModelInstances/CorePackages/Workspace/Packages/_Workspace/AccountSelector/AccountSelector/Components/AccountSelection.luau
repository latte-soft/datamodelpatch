local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v0.UserLib.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_useState_0 = l_React_0.useState;
local l_useDesignTokens_0 = v0.Style.useDesignTokens;
local v12 = require(script.Parent.SelectionRow);
local v13 = game:DefineFastFlag("ShouldUseSelectionRowInAccountSelectionRelease1", false);
return function(v14)
    local v15 = l_useStyle_0();
    local v16 = l_useDesignTokens_0();
    local v17, v18 = l_useState_0(false);
    local function v19()
        if not (v14.isDisabled or v14.user.isUnselectable) then
            v18(true);
            v14.onAccountSelection(v14.user.id);
        end;
    end;
    if not v13 then
        local function v20()
            return l_React_0.createElement(l_LoadableImage_0, {
                Size = UDim2.new(0, 48, 0, 48), 
                Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v14.user.id))), 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0.5, 0), 
                shouldHandleReloads = true
            });
        end;
        local function v21()
            return l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v16.Global.Opacity_0
            }, {
                VerticalLayout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                DisplayName = l_React_0.createElement(l_StyledTextLabel_0, {
                    text = v14.user.displayName, 
                    fontStyle = v15.Font.Header2, 
                    colorStyle = v15.Theme.TextEmphasis, 
                    layoutOrder = 0
                }), 
                UserName = l_React_0.createElement(l_StyledTextLabel_0, {
                    text = "@" .. v14.user.name, 
                    fontStyle = v15.Font.Body, 
                    colorStyle = v15.Theme.TextDefault, 
                    layoutOrder = 1
                })
            });
        end;
        return l_React_0.createElement(l_Cell_0, {
            onActivated = v19, 
            isSelected = v17, 
            head = (function()
                return l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v16.Global.Opacity_0
                }, {
                    Layout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v16.Global.Space_100)
                    }), 
                    AvatarThumbnail = v20(), 
                    Names = v21()
                });
            end)(), 
            tail = not not v17 and l_React_0.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(28, 28), 
                Image = l_Images_0["icons/status/success_large"], 
                ImageColor3 = v15.Theme.Success.Color, 
                BackgroundTransparency = 1
            }) or l_React_0.createElement("Frame"), 
            background = (function()
                return l_React_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = v15.Theme.BackgroundUIDefault.Color, 
                    BackgroundTransparency = v15.Theme.BackgroundUIDefault.BackgroundTransparency, 
                    BorderColor3 = v15.Theme.BackgroundUIDefault.Color
                });
            end)(), 
            size = UDim2.new(1, 0, 0, v16.Global.Size_800)
        });
    else
        return l_React_0.createElement(v12, {
            titleContent = v14.user.displayName, 
            subtitleContent = "@" .. (v14.user.name or ""), 
            renderImage = function()
                return l_React_0.createElement(l_LoadableImage_0, {
                    Size = UDim2.new(0, 48, 0, 48), 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v14.user.id))), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true
                });
            end, 
            iconKey = v14.user.iconKey, 
            onAccountSelection = v19, 
            userInteractionEnabled = not v14.user.isUnselectable
        });
    end;
end;
