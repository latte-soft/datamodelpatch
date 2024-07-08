local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(l_RobloxGui_0.Modules.Common.Create);
local v9 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v10 = require(l_RobloxGui_0.Modules.Common.Constants);
local v11 = require(l_RobloxGui_0.Modules.Shimmer);
local l_FFlag_0 = settings():GetFFlag("LocalizeErrorCodeString");
local v13 = game:DefineFastFlag("FixGamepadDisconnectHighlight2", false);
local v14 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local v15 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0);
local v16 = nil;
local function v17()
    v16 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
end;
v16 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):connect(v17);
local function _(v18, v19, v20)
    if v16 then
        local l_status_0, l_result_0 = pcall(function()
            return v16:FormatByKey(v18, v20);
        end);
        return not not l_status_0 and l_result_0 or v19;
    else
        return v19;
    end;
end;
local v24 = {
    Default = function()
        return v8("Frame")({
            Name = "ErrorPrompt", 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v10.COLORS.FLINT, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v10.ERROR_PROMPT_MAX_WIDTH.Default, 0, v10.ERROR_PROMPT_HEIGHT.Default), 
            Visible = false, 
            AutoLocalize = false, 
            ZIndex = 8; 
            v8("UIListLayout")({
                Name = "PromptLayout", 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            v8("UIScale")({
                Name = "PromptScale", 
                Scale = 0
            }), 
            v8("Frame")({
                Name = "TitleFrame", 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v10.ERROR_TITLE_FRAME_HEIGHT.Default), 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                v8("UIPadding")({
                    Name = "TitleFramePadding", 
                    PaddingBottom = UDim.new(0, 11), 
                    PaddingTop = UDim.new(0, 11)
                }), 
                v8("TextLabel")({
                    Name = "ErrorTitle", 
                    TextColor3 = v10.COLORS.WHITE, 
                    TextSize = 25, 
                    Size = UDim2.new(1, 0, 0, 28), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSansSemibold, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 8
                })
            }), 
            v8("Frame")({
                Name = "SplitLine", 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -2 * v10.SIDE_PADDING, 0, v10.SPLIT_LINE_THICKNESS), 
                BackgroundColor3 = v10.COLORS.PUMICE, 
                BorderSizePixel = 0, 
                ZIndex = 8
            }), 
            v8("Frame")({
                Name = "MessageArea", 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -v10.ERROR_TITLE_FRAME_HEIGHT.Default - v10.SPLIT_LINE_THICKNESS), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                v8("UIPadding")({
                    Name = "MessageAreaPadding", 
                    PaddingBottom = UDim.new(0, v10.SIDE_PADDING), 
                    PaddingLeft = UDim.new(0, v10.SIDE_PADDING), 
                    PaddingRight = UDim.new(0, v10.SIDE_PADDING), 
                    PaddingTop = UDim.new(0, v10.SIDE_PADDING)
                }), 
                v8("Frame")({
                    Name = "ErrorFrame", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 8; 
                    v8("UIListLayout")({
                        Name = "ErrorFrameLayout", 
                        Padding = UDim.new(0, v10.LAYOUT_PADDING), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    v8("TextLabel")({
                        Name = "ErrorMessage", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 1, -v10.BUTTON_HEIGHT - v10.LAYOUT_PADDING), 
                        TextSize = 20, 
                        TextColor3 = v10.COLORS.PUMICE, 
                        ZIndex = 8, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        Font = Enum.Font.SourceSans
                    }), 
                    v8("Frame")({
                        Name = "ButtonArea", 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v10.BUTTON_HEIGHT), 
                        ZIndex = 8, 
                        LayoutOrder = 2, 
                        SelectionGroup = true, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop; 
                        v8("UIGridLayout")({
                            Name = "ButtonLayout", 
                            CellPadding = UDim2.new(0, v10.BUTTON_CELL_PADDING, 0, 0), 
                            CellSize = UDim2.new(1, 0, 0, v10.BUTTON_HEIGHT), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    })
                })
            })
        });
    end
};
local v28 = {
    Default = function(v25, v26, v27)
        return v8("ImageButton")({
            Name = v25 .. "Button", 
            BackgroundTransparency = 1, 
            ImageColor3 = not not v27 and v10.COLORS.WHITE or v10.COLORS.PUMICE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = not not v27 and v10.PRIMARY_BUTTON_TEXTURE or v10.SECONDARY_BUTTON_TEXTURE, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            LayoutOrder = v26, 
            ZIndex = 8; 
            v8("TextLabel")({
                Name = "ButtonText", 
                Text = v25, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextColor3 = not not v27 and v10.COLORS.SLATE or v10.COLORS.PUMICE, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = Enum.Font.SourceSans, 
                TextSize = 20, 
                ZIndex = 8
            })
        });
    end
};
local v29 = {};
v29.__index = v29;
v29.new = function(v30, v31)
    local v32 = setmetatable({}, v29);
    v32._frame = not not v30 and v24[v30]() or v24.Default();
    v32._isOpen = false;
    v32._openAnimation = l_TweenService_0:Create(v32._frame.PromptScale, v15, {
        Scale = 1
    });
    v32._closeAnimation = l_TweenService_0:Create(v32._frame.PromptScale, v15, {
        Scale = 0
    });
    v32._buttonCount = 0;
    v32._playAnimation = true;
    v32._hideErrorCode = false;
    v32._menuIsOpenKey = "ErrorPrompt";
    if v31 then
        if v31.PlayAnimation ~= nil then
            v32._playAnimation = v31.PlayAnimation;
        end;
        if v31.HideErrorCode ~= nil then
            v32._hideErrorCode = v31.HideErrorCode;
        end;
        if v31.MenuIsOpenKey ~= nil then
            v32._menuIsOpenKey = v31.MenuIsOpenKey;
        end;
        v32._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = v31.MessageTextScaled or false;
    end;
    return v32;
end;
v29._open = function(v33, v34, v35)
    v33:setErrorText(v34, v35);
    if not v14() then
        v33:resizeHeight();
    else
        v33:resizeHeight(l_RobloxGui_0.AbsoluteSize.Y);
    end;
    if not v33._isOpen then
        v9.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        l_GuiService_0:SetMenuIsOpen(true, v33._menuIsOpenKey);
        v33._frame.Visible = true;
        v33._isOpen = true;
        if not v33._playAnimation then
            v33._frame.PromptScale.Scale = 1;
        else
            v33._openAnimation:Play();
            v33._openAnimation.Completed:wait();
            v33._frame.PromptScale.Scale = 1;
        end;
        if not (v13 or not l_VRService_0.VREnabled and not l_GuiService_0:IsTenFootInterface()) then
            l_GuiService_0:Select(v33._frame.MessageArea.ErrorFrame.ButtonArea);
        end;
    end;
    if not ((not v13 or not v33._isOpen) or not l_VRService_0.VREnabled and not l_GuiService_0:IsTenFootInterface()) then
        l_GuiService_0:Select(v33._frame.MessageArea.ErrorFrame.ButtonArea);
    end;
end;
v29._close = function(v36)
    if v36._isOpen then
        v9.pop("ErrorPromptOverride");
        l_GuiService_0:SetMenuIsOpen(false, v36._menuIsOpenKey);
        v36._isOpen = false;
        if not v36._playAnimation then
            v36._frame.PromptScale.Scale = 0;
        else
            v36._closeAnimation:Play();
            v36._closeAnimation.Completed:wait();
        end;
        v36._frame.Visible = false;
    end;
end;
v29.setParent = function(v37, v38)
    v37._frame.Parent = v38;
end;
v29.setErrorText = function(v39, v40, v41)
    local l_ErrorMessage_0 = v39._frame.MessageArea.ErrorFrame.ErrorMessage;
    if not v39._hideErrorCode then
        if not l_FFlag_0 then
            if v41 then
                l_ErrorMessage_0.Text = ("%s\n(Error Code: %d)"):format(v40, v41.Value);
                return ;
            else
                l_ErrorMessage_0.Text = ("%s\n(Error Code: -1)"):format(v40);
                return ;
            end;
        else
            local v43 = -1;
            if v41 then
                v43 = v41.Value;
            end;
            local v44 = ("Error Code: %d"):format(v43);
            local v45 = {
                ERROR_CODE = tostring(v43)
            };
            local v46;
            if v16 then
                local l_pcall_0 = pcall;
                local v48 = "InGame.ConnectionError.Message.ErrorCode";
                local v49;
                l_pcall_0, v49 = l_pcall_0(function()
                    return v16:FormatByKey(v48, v45);
                end);
                v46 = not not l_pcall_0 and v49 or v44;
            else
                v46 = v44;
            end;
            l_ErrorMessage_0.Text = ("%s\n(%s)"):format(v40, v46);
            return ;
        end;
    else
        l_ErrorMessage_0.Text = v40;
        return ;
    end;
end;
v29.setErrorTitle = function(v50, v51, v52)
    if v51 then
        local l_ErrorTitle_0 = v50._frame.TitleFrame.ErrorTitle;
        if not v52 then
            l_ErrorTitle_0.Text = v51;
            return ;
        else
            local v54;
            if v16 then
                local l_pcall_1 = pcall;
                local v56 = nil;
                local v57;
                l_pcall_1, v57 = l_pcall_1(function()
                    return v16:FormatByKey(v52, v56);
                end);
                v54 = not not l_pcall_1 and v57 or v51;
            else
                v54 = v51;
            end;
            l_ErrorTitle_0.Text = v54;
            return ;
        end;
    else
        return ;
    end;
end;
v29.onErrorChanged = function(v58, v59, v60)
    if v59 == "" then
        v58:_close();
        return ;
    else
        if v59 ~= "" then
            v58:_open(v59, v60);
        end;
        return ;
    end;
end;
v29._relayout = function(v61)
    local l_ButtonArea_0 = v61._frame.MessageArea.ErrorFrame.ButtonArea;
    if v61._buttonCount == 0 then
        l_ButtonArea_0.Visible = false;
        return ;
    else
        local v63 = ((v61._frame.Size.X.Offset - (v61._buttonCount - 1) * v10.BUTTON_CELL_PADDING) - 2 * v10.SIDE_PADDING) / v61._buttonCount;
        l_ButtonArea_0.Visible = true;
        l_ButtonArea_0.ButtonLayout.CellSize = UDim2.new(0, v63, 0, v10.BUTTON_HEIGHT);
        return ;
    end;
end;
v29.clearButtons = function(v64)
    local l_ButtonArea_1 = v64._frame.MessageArea.ErrorFrame.ButtonArea;
    if v64._primaryShimmer then
        v64._primaryShimmer = nil;
    end;
    for _, v67 in pairs((l_ButtonArea_1:GetChildren())) do
        if v67.name ~= "ButtonLayout" then
            v67:Destroy();
        end;
    end;
end;
v29.updateButtons = function(v68, v69, v70)
    if not v69 then
        v69 = {};
    end;
    if not v70 then
        v70 = "Default";
    end;
    v68:clearButtons();
    local l_ButtonArea_2 = v68._frame.MessageArea.ErrorFrame.ButtonArea;
    local v72 = 0;
    for _, v74 in pairs(v69) do
        local l_Text_0 = v74.Text;
        if v74.LocalizationKey then
            local l_LocalizationKey_0 = v74.LocalizationKey;
            local l_Text_1 = v74.Text;
            if v16 then
                local l_pcall_2 = pcall;
                local v79 = nil;
                local l_l_LocalizationKey_0_0 = l_LocalizationKey_0 --[[ copy: 11 -> 16 ]];
                local v81;
                l_pcall_2, v81 = l_pcall_2(function()
                    return v16:FormatByKey(l_l_LocalizationKey_0_0, v79);
                end);
                l_Text_0 = not not l_pcall_2 and v81 or l_Text_1;
            else
                l_Text_0 = l_Text_1;
            end;
        end;
        local v82 = v28[v70](l_Text_0, v74.LayoutOrder, v74.Primary);
        if v74.Primary then
            v68._primaryShimmer = v11.new(v82, "PrimaryButton");
        end;
        v82.Parent = l_ButtonArea_2;
        v82.Activated:connect(v74.Callback);
        v72 = v72 + 1;
    end;
    if v68._buttonCount ~= v72 then
        v68._buttonCount = v72;
        v68:_relayout();
    end;
end;
v29.primaryShimmerPlay = function(v83)
    if v83._primaryShimmer then
        v83._primaryShimmer:play();
    end;
end;
v29.primaryShimmerStop = function(v84)
    if v84._primaryShimmer then
        v84._primaryShimmer:stop();
    end;
end;
v29.resizeWidthAndHeight = function(v85, v86, v87)
    v85:resizeWidth(v86);
    v85:resizeHeight(v87);
    v85:_relayout();
end;
v29.resizeWidth = function(v88, v89)
    local l_Offset_0 = v88._frame.Size.X.Offset;
    local v91 = v89 - 2 * v10.SIDE_MARGIN;
    if v10.ERROR_PROMPT_MAX_WIDTH.Default < v91 then
        if l_Offset_0 == v10.ERROR_PROMPT_MAX_WIDTH.Default then
            return ;
        else
            v91 = v10.ERROR_PROMPT_MAX_WIDTH.Default;
        end;
    end;
    if v91 < v10.ERROR_PROMPT_MIN_WIDTH.Default then
        if l_Offset_0 == v10.ERROR_PROMPT_MIN_WIDTH.Default then
            return ;
        else
            v91 = v10.ERROR_PROMPT_MIN_WIDTH.Default;
        end;
    end;
    v88._frame.Size = UDim2.new(0, v91, 0, v88._frame.Size.Y.Offset);
    if not v14() then
        v88:resizeHeight();
        v88:_relayout();
    end;
end;
v29.resizeHeight = function(v92, v93)
    local l_ErrorMessage_1 = v92._frame.MessageArea.ErrorFrame.ErrorMessage;
    local v95 = (((((v10.ERROR_TITLE_FRAME_HEIGHT.Default + l_TextService_0:GetTextSize(l_ErrorMessage_1.Text, l_ErrorMessage_1.TextSize, l_ErrorMessage_1.Font, (Vector2.new(v92._frame.Size.X.Offset - 2 * v10.SIDE_PADDING, 1000))).Y) + v10.SPLIT_LINE_THICKNESS) + v10.BUTTON_HEIGHT) + v10.LAYOUT_PADDING) + 2 * v10.SIDE_PADDING) + 1;
    if v14() then
        v95 = math.max(math.min(v95, v93 - 2 * v10.VERTICAL_MARGIN), v10.ERROR_PROMPT_MIN_HEIGHT.Default);
    end;
    v92._frame.Size = UDim2.new(0, v92._frame.Size.X.Offset, 0, v95);
end;
return v29;
