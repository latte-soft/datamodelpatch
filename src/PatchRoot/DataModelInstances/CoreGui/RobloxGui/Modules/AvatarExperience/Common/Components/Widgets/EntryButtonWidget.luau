local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelectedTheme_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.Common.WidgetUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v18)
    local v19 = l_useNavigation_0();
    local v20 = v9(v14);
    local v22 = l_useSelector_0(function(v21)
        return v21.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
    end);
    local v24 = l_useSelector_0(function(v23)
        return v23.Navigation.history;
    end);
    local v25 = l_useSelectedTheme_0() == "dark";
    local v26 = l_useStyle_0();
    local l_Theme_0 = v26.Theme;
    local l_Font_0 = v26.Font;
    local l_widgetInfo_0 = v18.widgetInfo;
    local l_type_0 = l_widgetInfo_0.type;
    local v31 = if not l_type_0 then nil else v16.TypeToImageInfo[l_type_0];
    local function v32()
        v20.widgetInteraction(v22, v16.ActionType.WIDGET_CLICK, nil, v18.widgetRow, nil, nil, l_widgetInfo_0.id);
        v15.getEntryButtonWidgetActivationFunc(l_type_0, v19, v24)();
    end;
    local v33 = nil;
    local v34 = nil;
    local l_rowHeight_0 = v18.rowHeight;
    if v31 then
        l_rowHeight_0 = l_rowHeight_0 * v31.rowScale;
        v33 = if not v25 then v31.backgroundImageLight else v31.backgroundImageDark;
        v34 = if not v25 then v31.contentImageLight else v31.contentImageDark;
    end;
    local v36 = not v31 and 1.5 or v31.widthHeightRatio;
    local v37 = l_useLocalization_0({
        titleText = if not not l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.title else nil, 
        descText = if not not l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.description else nil
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_rowHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v18.LayoutOrder
    }, {
        EntryButton = v3.createElement(l_Focusable_0.ImageButton, {
            Size = UDim2.new(1, -3, 1, 0), 
            Position = UDim2.fromOffset(1, 0), 
            BackgroundTransparency = 1, 
            Image = v33, 
            ScaleType = Enum.ScaleType.Crop, 
            [v3.Event.Activated] = v32, 
            ClipsDescendants = true, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect)
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIStroke = v3.createElement("UIStroke", {
                Color = l_Theme_0.Divider.Color, 
                Transparency = l_Theme_0.Divider.Transparency, 
                Thickness = 1
            }), 
            TextFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 8)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Title = if not v37.titleText then nil else v3.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.Header1.Font, 
                    Text = v37.titleText, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                    TextWrapped = false, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                Description = if not v37.descText then nil else v3.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.SubHeader1.Font, 
                    Text = v37.descText, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextSize = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize, 
                    TextWrapped = false, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 2
                })
            }), 
            ContentImageLabel = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = v34, 
                Size = UDim2.fromOffset(l_rowHeight_0 * v36, l_rowHeight_0)
            })
        })
    });
end;
