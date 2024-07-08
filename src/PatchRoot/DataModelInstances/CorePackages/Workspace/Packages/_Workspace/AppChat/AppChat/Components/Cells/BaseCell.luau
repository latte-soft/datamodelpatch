local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useState_0 = v3.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v3.memo;
local l_useMemo_0 = v3.useMemo;
local v8 = game:DefineFastFlag("OptimizeChatBaseCell", false);
local v9 = require(l_Parent_0.UIBlox);
local l_ControlState_0 = v9.Core.Control.Enum.ControlState;
local v11 = if not v8 then v9.Core.Control.Interactable else l_memo_0(v9.Core.Control.Interactable);
local _ = require(l_script_FirstAncestor_0.types);
local l_FFlagUIBloxUseNewInteractable_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxUseNewInteractable;
local v14 = {
    Size = UDim2.new(1, 0, 0, 48), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242), 
    onPressedBackgroundTransparency = 1, 
    LayoutOrder = 0, 
    isDisabled = false, 
    onActivated = function()
        print("BaseCell onActivated");
    end, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    avatarCircleCellWidth = 60
};
return l_memo_0(function(v15)
    local v16 = v2.Dictionary.join(v14, v15);
    local v17, v18 = l_useState_0(l_ControlState_0.Initialize);
    local v19 = {};
    local v22 = v3.useCallback(function(_, v21)
        v18(v21);
    end, {});
    if not (not (v17 == l_ControlState_0.Pressed) or v8) then
        v19.overlay = v3.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v16.onPressedBackgroundTransparency, 
            BackgroundColor3 = v16.onPressedBackground3, 
            BorderSizePixel = 0
        });
    end;
    local v23 = if not v8 then nil else l_useMemo_0(function()
        if v17 == l_ControlState_0.Pressed then
            return (v3.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v16.onPressedBackgroundTransparency, 
                BackgroundColor3 = v16.onPressedBackground3, 
                BorderSizePixel = 0
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v17, v16.onPressedBackground3, v16.onPressedBackgroundTransparency));
    if not (not v16.showDivider or v8) then
        v19.divider = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v3.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            divider = v3.createElement("Frame", {
                BackgroundTransparency = v16.dividerTransparency, 
                BackgroundColor3 = v16.dividerColor3, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v16.avatarCircleCellWidth, 0, 1)
            })
        });
    end;
    local v24 = if not v8 then nil else l_useMemo_0(function()
        if not v16.showDivider then
            return nil;
        else
            return (v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v3.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                divider = v3.createElement("Frame", {
                    BackgroundTransparency = v16.dividerTransparency, 
                    BackgroundColor3 = v16.dividerColor3, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -v16.avatarCircleCellWidth, 0, 1)
                })
            }));
        end;
    end, l_dependencyArray_0(v16.showDivider, v16.dividerTransparency, v16.dividerColor3, v16.avatarCircleCellWidth));
    return v3.createElement(v11, {
        onStateChanged = not l_FFlagUIBloxUseNewInteractable_0 and function(_, v26)
            v18(v26);
        end or v22, 
        isDisabled = v16.isDisabled, 
        [v3.Event.Activated] = v16.onActivated, 
        AutoButtonColor = false, 
        Size = v16.Size, 
        BackgroundColor3 = v16.BackgroundColor3, 
        LayoutOrder = v16.LayoutOrder, 
        BorderSizePixel = 0
    }, if not v8 then v2.Dictionary.join(v19, v16.children or {}) else l_useMemo_0(function()
        return v2.Dictionary.join(v16.children or {}, {
            overlay = v23, 
            divider = v24
        });
    end, l_dependencyArray_0(v16.children, v23, v24)));
end);
