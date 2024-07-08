local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Util.DateHelper);
local v8 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v9 = require(l_Modules_0.LuaApp.FitChildren);
local v10 = require(l_Modules_0.LuaApp.Components.Generic.BirthdayPicker);
local v11 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v12 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v13 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v14 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local v20 = require(l_CorePackages_0.Packages.Otter);
local v21 = require(l_Modules_0.LuaApp.Constants);
local v22 = UDim2.new(0, 36, 0, 36);
local v23 = l_Images_0["icons/navigation/close"];
local v24 = Vector2.new(540, 360);
local v25 = Vector2.new(100, 340);
local v26 = v2.PureComponent:extend("SignUpBirthdayPickerOverlay");
v26.init = function(v27)
    local l_initialBirthday_0 = v27.props.initialBirthday;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if l_initialBirthday_0 then
        v29 = l_initialBirthday_0.Month;
        v30 = l_initialBirthday_0.Day;
        v31 = l_initialBirthday_0.Year;
    end;
    local l_screenSize_0 = v27.props.screenSize;
    v27.state = {
        month = v29, 
        day = v30, 
        year = v31, 
        hasValidDate = false, 
        closingOverlay = false, 
        shouldReturnBirthdayOnClose = false
    };
    local v33, v34 = v2.createBinding(l_screenSize_0.Y);
    v27.currentYOffset = v33;
    v27.updateCurrentYOffset = v34;
    v27.updatePositionFromAnimation = function(v35)
        v27.updateCurrentYOffset((1 - v35) * l_screenSize_0.Y - v21.BOTTOM_BAR_SIZE);
    end;
    v27.onCloseOverlay = function(v36)
        if not (not v27.isMounted or v27.state.closingOverlay) then
            if not v27.props.navigateBackWithoutSelection or v36 then
                v27.motor:setGoal(v20.spring(0, v27.springOptions));
                spawn(function()
                    if v27.isMounted then
                        v27:setState({
                            shouldReturnBirthdayOnClose = v36, 
                            closingOverlay = true
                        });
                    end;
                end);
            else
                v27.isMounted = false;
                v27.props.closeCentralOverlay();
                v27.props.navigateBack();
                return ;
            end;
        end;
    end;
    v27.onOverlayAnimatedOut = function()
        local l_onClose_0 = v27.props.onClose;
        local l_closeCentralOverlay_0 = v27.props.closeCentralOverlay;
        local v39 = (not not v27.state.shouldReturnBirthdayOnClose and v27.state.hasValidDate) and v8.new({
            Month = v27.state.month, 
            Day = v27.state.day, 
            Year = v27.state.year
        }) or nil;
        v27.motor:setGoal(v20.spring(0, v27.springOptions));
        if l_onClose_0 then
            l_onClose_0(v39);
        end;
        l_closeCentralOverlay_0();
    end;
    v27.updateBirthday = function(v40, v41, v42)
        local v43 = v7:isValidDate(v40, v41, v42);
        spawn(function()
            if v27.isMounted then
                v27:setState({
                    month = v40, 
                    day = v41, 
                    year = v42, 
                    hasValidDate = v43
                });
            end;
        end);
    end;
    v27.springOptions = {
        frequency = 3
    };
    v27.isMounted = false;
end;
v26.didMount = function(v44)
    v44.isMounted = true;
    v44.motor = v20.createSingleMotor(0);
    v44.motor:onStep(function(v45)
        v44.updatePositionFromAnimation(v45);
        if v44.state.closingOverlay and v45 <= 0.1 then
            spawn(function()
                if v44.isMounted then
                    v44:setState({
                        closingOverlay = false
                    });
                end;
            end);
            v44.onOverlayAnimatedOut();
        end;
    end);
    delay(0, function()
        v44.motor:setGoal(v20.spring(1, v44.springOptions));
    end);
end;
v26.willUnmount = function(v46)
    v46.isMounted = false;
    v46.motor:destroy();
end;
v26.render = function(v47)
    local l_hasValidDate_0 = v47.state.hasValidDate;
    return l_withStyle_0(function(v49)
        return v6({
            confirmBirthdayText = "Authentication.SignUp.Label.ConfirmBirthday", 
            titleText = "Authentication.SignUp.Label.Birthday"
        })(function(v50)
            local v51 = v47.props.formFactor == l_FormFactor_0.WIDE;
            local v52 = not v51 and 1 or 0.5;
            local v53 = not v51 and 1 or 0.5;
            return v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, v24.Y), 
                Position = v47.currentYOffset:map(function(v54)
                    return UDim2.new(0.5, 0, v53, v54);
                end), 
                AnchorPoint = Vector2.new(0.5, v52), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = v49.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true
            }, {
                SizeConstraint = v51 and v2.createElement("UISizeConstraint", {
                    MaxSize = v24, 
                    MinSize = v25
                }), 
                HeaderFrame = v2.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    Text = ""
                }, {
                    BackButton = v2.createElement(l_ImageSetButton_0, {
                        Size = v22, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = v23, 
                        ImageColor3 = v49.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v2.Event.Activated] = function()
                            v47.onCloseOverlay(false);
                        end
                    }), 
                    Title = v50.titleText and v2.createElement(v14, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v9.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v50.titleText or "", 
                        TextWrapped = true, 
                        Font = v49.Font.CaptionHeader.Font, 
                        TextSize = v49.Font.BaseSize * v49.Font.Header1.RelativeSize, 
                        TextColor3 = v49.Theme.TextEmphasis.Color, 
                        TextTransparency = v49.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v49.Theme.UIEmphasis.Color
                }), 
                ContentFrame = v2.createElement(v9.FitTextButton, {
                    Size = UDim2.new(1, 0, 1, -49), 
                    Position = UDim2.new(0.5, 0, 0, 49), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    fitAxis = v9.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = ""
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20), 
                        PaddingTop = UDim.new(0, 20), 
                        PaddingBottom = UDim.new(0, 20)
                    }), 
                    Content = v2.createElement(v10, {
                        layoutOrder = 1, 
                        updateBirthday = v47.updateBirthday, 
                        initialMonth = v47.state.month, 
                        initialDay = v47.state.day, 
                        initialYear = v47.state.year
                    }), 
                    Spacing = v2.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 30), 
                        BackgroundTransparency = 1
                    }), 
                    ConfirmBirthdayButton = v2.createElement(v11, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        Text = v50.confirmBirthdayText, 
                        onActivated = function()
                            if l_hasValidDate_0 then
                                v47.onCloseOverlay(true);
                            end;
                        end, 
                        isDisabled = not l_hasValidDate_0
                    })
                })
            });
        end);
    end);
end;
return (v3.connect(function(v55, _)
    return {
        screenSize = v55.ScreenSize, 
        formFactor = v55.FormFactor
    };
end, function(v57)
    return {
        closeCentralOverlay = function()
            v57(v12());
        end, 
        navigateBack = function()
            return v57(v13());
        end
    };
end)(v26));
