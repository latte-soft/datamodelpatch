local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
local v3 = require(l_Modules_0.Shell.Components.Common.UserThumbnailLoader);
local v4 = require(l_Modules_0.Shell.LocalizedStrings);
local v5 = require(l_Modules_0.Shell.Utility);
local v6 = require(l_Modules_0.Shell.Components.Common.SoundComponent);
local v7 = v1.PureComponent:extend("PresenceCard");
v7.init = function(v8)
    v8.selectionImageObject = v5.Create("ImageLabel")({
        Name = "SelectorImage", 
        Image = v2.Images.ButtonSelector, 
        Position = UDim2.new(0, -7, 0, -7), 
        Size = UDim2.new(1, 14, 1, 14), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(31, 31, 63, 63)
    });
    v8.onCreate = function(v9)
        v8.ref = v9;
    end;
    v8.defaultProps = {
        buttonColor3 = v2.Colors.WhiteButton, 
        buttonTransparency = 0.8, 
        textColor3 = v2.Colors.WhiteText, 
        iconColor3 = v2.Colors.WhiteText
    };
    v8.focusedProps = {
        buttonColor3 = v2.Colors.BlueButton, 
        buttonTransparency = 0, 
        textColor3 = v2.Colors.BlackText, 
        iconColor3 = v2.Colors.BlackText
    };
    v8.buttonImage = v2.Images.ButtonDefault;
end;
v7.render = function(v10)
    local l_props_0 = v10.props;
    local v12 = not not v10.props.focused and v10.focusedProps or v10.defaultProps;
    local v13 = l_props_0.gamertag or "";
    local v14 = l_props_0.robloxName or "";
    local v15 = v13 ~= "";
    local v16 = v14 ~= "";
    local v17 = "";
    local l_GreySelectedButton_0 = v2.Colors.GreySelectedButton;
    local function _(v19, v20)
        l_GreySelectedButton_0 = v20;
        if v19 and v19 ~= "" then
            v17 = v19;
        end;
    end;
    if l_props_0.robloxStatus == "InGame" then
        local l_lastLocation_0 = l_props_0.lastLocation;
        l_GreySelectedButton_0 = v2.Colors.GreenText;
        if l_lastLocation_0 and l_lastLocation_0 ~= "" then
            v17 = l_lastLocation_0;
        end;
    elseif l_props_0.robloxStatus == "InStudio" then
        local l_lastLocation_1 = l_props_0.lastLocation;
        l_GreySelectedButton_0 = v2.Colors.OrangeText;
        if l_lastLocation_1 and l_lastLocation_1 ~= "" then
            v17 = l_lastLocation_1;
        end;
    elseif l_props_0.robloxStatus == "Online" then
        l_GreySelectedButton_0 = v2.Colors.BlueText;
        v17 = "Roblox";
    elseif l_props_0.xboxStatus and l_props_0.xboxStatus == "Online" then
        local v24 = v4:LocalizedString("OnlineWord");
        l_GreySelectedButton_0 = v2.Colors.BlueText;
        if v24 and v24 ~= "" then
            v17 = v24;
        end;
    else
        local v25 = v4:LocalizedString("OfflineWord");
        l_GreySelectedButton_0 = v2.Colors.GreyText;
        if v25 and v25 ~= "" then
            v17 = v25;
        end;
    end;
    return v1.createElement("ImageButton", {
        Image = v10.buttonImage, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        LayoutOrder = l_props_0.layoutOrder, 
        Size = l_props_0.size or UDim2.new(0, 440, 0, 120), 
        ImageColor3 = v12.buttonColor3, 
        ImageTransparency = v12.buttonTransparency, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        SelectionImageObject = v10.selectionImageObject, 
        BackgroundTransparency = 1, 
        [v1.Event.SelectionGained] = l_props_0.onSelectionGained, 
        [v1.Event.SelectionLost] = l_props_0.onSelectionLost, 
        [v1.Event.Activated] = l_props_0.onActivated, 
        [v1.Ref] = v10.onCreate
    }, {
        MoveSelection = v1.createElement(v6, {
            SoundName = "MoveSelection"
        }), 
        AvatarImage = v1.createElement(v3, {
            rbxuid = l_props_0.robloxuid, 
            thumbnailType = Enum.ThumbnailType.HeadShot, 
            thumbnailSize = Enum.ThumbnailSize.Size100x100, 
            position = UDim2.new(0, 10, 0, 10), 
            size = UDim2.new(0, 100, 0, 100)
        }), 
        ContentContainer = v1.createElement("Frame", {
            Size = UDim2.new(1, -140, 1, 0), 
            Position = UDim2.new(0, 126, 0, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            UIPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10)
            }), 
            UIListLayout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 7), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            GamertagContainer = v15 and v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 30), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                GamertagLabel = v1.createElement("TextLabel", {
                    Text = v13, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v12.textColor3, 
                    Font = v2.Fonts.Regular, 
                    TextSize = 30, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                })
            }), 
            RobloxNameContainer = v16 and v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 30), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                RobloxIcon = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v2.Images.RobloxIcon, 
                    ImageColor3 = v12.iconColor3, 
                    Position = UDim2.new(0, 0, 0, 1), 
                    Size = UDim2.new(0, 28, 0, 28)
                }), 
                RobloxNameLabel = v1.createElement("TextLabel", {
                    Text = v14, 
                    Size = UDim2.new(1, -38, 1, 0), 
                    Position = UDim2.new(0, 38, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v12.textColor3, 
                    Font = v2.Fonts.Regular, 
                    TextSize = 30, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                })
            }), 
            StatusContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 26), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1
            }, {
                PresenceStatusImage = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v2.Images.OnlineStatusIcon, 
                    Size = UDim2.new(0, 18, 0, 18), 
                    Position = UDim2.new(0, 5, 0, 4), 
                    ImageColor3 = l_GreySelectedButton_0
                }), 
                PresenceLabel = v1.createElement("TextLabel", {
                    Text = v17, 
                    Size = UDim2.new(1, -38, 1, 0), 
                    Position = UDim2.new(0, 33, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v12.textColor3, 
                    Font = v2.Fonts.Regular, 
                    TextSize = 26, 
                    BackgroundTransparency = 1
                })
            })
        })
    });
end;
v7.didMount = function(v26)
    delay(0, function()
        if v26.props.selected then
            v5.SetSelectedCoreObject(v26.ref);
        end;
    end);
end;
v7.didUpdate = function(v27, v28, _)
    if not (v28.selected or not v27.props.selected) then
        v5.SetSelectedCoreObject(v27.ref);
    end;
end;
return v7;
