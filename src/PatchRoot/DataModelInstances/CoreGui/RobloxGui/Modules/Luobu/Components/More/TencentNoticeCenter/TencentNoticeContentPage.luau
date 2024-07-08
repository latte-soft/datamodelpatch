local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local _ = require(l_Modules_0.Luobu.Constants);
local _ = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v10 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_Modules_0.Common.Text);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v15 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local v16 = v2.PureComponent:extend("TencentNoticeContentPage");
v16.validateProps = v12.strictInterface({
    notice = v12.table, 
    dateText = v12.string, 
    screenWidth = v12.number, 
    screenHeight = v12.number, 
    formFactor = v12.string, 
    openNoticeDetail = v12.callback
});
v16.init = function(v17)
    v17.onNoticeClicked = function()
        v17.props.openNoticeDetail(v17.props.notice.noticeUrl, v17.props.notice.title);
    end;
end;
v16.render = function(v18)
    local l_title_0 = v18.props.notice.title;
    local l_dateText_0 = v18.props.dateText;
    local l_screenWidth_0 = v18.props.screenWidth;
    local l_screenHeight_0 = v18.props.screenHeight;
    local v23 = l_screenWidth_0 - 48;
    return l_withStyle_0(function(v24)
        local l_BackgroundUIDefault_0 = v24.Theme.BackgroundUIDefault;
        local l_Font_0 = v24.Font;
        local l_Theme_0 = v24.Theme;
        return v2.createElement("Frame", {
            Size = UDim2.fromOffset(l_screenWidth_0, l_screenHeight_0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
            BackgroundTransparency = l_BackgroundUIDefault_0.Transparency
        }, {
            TopBarFrame = v2.createElement(v9.Container, {
                titleText = "", 
                leftItem = v9.BackButton
            }), 
            PageContent = v2.createElement(v9.PageContent, {}, {
                Scroller = v2.createElement(v10, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Title = v2.createElement("TextLabel", {
                        Size = UDim2.new(0.85, 0, 0, 28), 
                        Position = UDim2.fromOffset(24, 24), 
                        Text = l_title_0, 
                        Font = l_Font_0.Header2.Font, 
                        TextSize = v24.Font.BaseSize * v24.Font.Header2.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1
                    }), 
                    DateLabel = v2.createElement("TextLabel", {
                        Size = UDim2.fromOffset(v23, 14), 
                        Position = UDim2.fromOffset(24, 64), 
                        Text = l_dateText_0, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        Font = v24.Font.CaptionBody.Font, 
                        TextSize = v24.Font.BaseSize * v24.Font.CaptionBody.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1
                    }), 
                    DividerLine = v2.createElement("Frame", {
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.fromOffset(v23, 1), 
                        Position = UDim2.fromOffset(24, 90)
                    }), 
                    ContentFrame = v18:renderContent(l_screenWidth_0, v24)
                })
            })
        });
    end);
end;
v16.renderContent = function(v28, v29, v30)
    local l_content_0 = v28.props.notice.content;
    local l_type_0 = v28.props.notice.type;
    local l_portraitPicUrl_0 = v28.props.notice.portraitPicUrl;
    local l_landscapePicUrl_0 = v28.props.notice.landscapePicUrl;
    local l_formFactor_0 = v28.props.formFactor;
    local l_Font_1 = v30.Font.Body.Font;
    local v37 = v30.Font.BaseSize * v30.Font.Body.RelativeSize;
    local l_TextDefault_0 = v30.Theme.TextDefault;
    local l_noticeUrl_0 = v28.props.notice.noticeUrl;
    if l_type_0 == v15.Text then
        local v40 = v29 - 48;
        local v41 = l_content_0 ~= nil;
        local v42 = v13.GetTextHeight(l_content_0, l_Font_1, v37, 10000);
        local l_screenHeight_1 = v28.props.screenHeight;
        return v2.createElement("TextButton", {
            Position = UDim2.fromOffset(24, 115), 
            Size = UDim2.fromOffset(v40, v42 < l_screenHeight_1 and l_screenHeight_1 or v42), 
            Text = l_content_0, 
            Font = l_Font_1, 
            TextSize = v37, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_TextDefault_0.Color, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            [v2.Event.Activated] = v28.onNoticeClicked, 
            Active = v41
        });
    elseif l_type_0 == v15.Image then
        local v44 = l_noticeUrl_0 ~= nil;
        local v45 = v29 - 64;
        local v46 = l_formFactor_0 == l_FormFactor_0.WIDE;
        return v2.createElement("TextButton", {
            Size = UDim2.fromOffset(v45, (not v46 and 1.4516 or 0.4074) * v45), 
            Position = UDim2.fromOffset(32, 115), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Active = v44, 
            [v2.Event.Activated] = v28.onNoticeClicked
        }, (v2.createElement(l_LoadableImage_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            Image = not not v46 and l_landscapePicUrl_0 or l_portraitPicUrl_0, 
            useShimmerAnimationWhileLoading = true, 
            showFailedStateWhenLoadingFailed = true
        })));
    else
        warn("Error: TencentNoticeType is incorrect. Please fix or add new type:" .. l_type_0);
        return ;
    end;
end;
return v3.connect(function(v47)
    return {
        formFactor = v47.FormFactor, 
        screenWidth = v47.ScreenSize.X, 
        screenHeight = v47.ScreenSize.Y
    };
end, function(v48)
    return {
        openNoticeDetail = function(v49, v50)
            v48(v11(v49, v50));
        end
    };
end)(v16);
