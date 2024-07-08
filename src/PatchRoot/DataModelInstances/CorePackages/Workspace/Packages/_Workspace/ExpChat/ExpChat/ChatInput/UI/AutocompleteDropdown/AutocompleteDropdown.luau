local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_List_0 = require(l_Parent_0.llama).List;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v7 = require(l_script_FirstAncestor_0.Config);
local v8 = require(script.Parent.AutocompleteEntry);
return function(v9)
    local v10 = v3.useRef(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v16 = v3.useCallback(function(v12)
        local v15 = l_Dictionary_0.map(v12, function(v13, v14)
            return v3.createElement(v8, {
                result = v13, 
                layoutOrder = v14, 
                chatInputBarSettings = v9.chatInputBarSettings, 
                setTransparency = v9.setTransparency, 
                transparencyValue = v9.transparencyValue, 
                isDividerVisible = l_List_0.count(v12) ~= v14, 
                selectedIndex = v9.selectedIndex, 
                autocompleteType = v9.autocompleteType, 
                onAutocompleteDropdownHover = v9.onAutocompleteDropdownHover, 
                onAutocompleteSelected = v9.onAutocompleteSelected
            }), v13;
        end);
        v15["$layout"] = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v15;
    end);
    local function v27()
        if not v10.current then
            return Vector2.new(0, 0);
        else
            local l_current_0 = v9.autocompleteDropdownRef.current;
            local v18 = not not l_current_0 and l_current_0.AbsoluteSize.Y or v7.AutocompleteFrameDefaultSizeY;
            local v19 = v9.chatInputBarSettings.TextSize + 16;
            local v20 = 0;
            if not ((((not l_current_0 or not l_current_0:FindFirstChild("ScrollBarFrame")) or not l_current_0.ScrollBarFrame:FindFirstChild("ScrollViewFrame")) or not l_current_0.ScrollBarFrame.ScrollViewFrame:FindFirstChild("ScrollView")) or not l_current_0.ScrollBarFrame.ScrollViewFrame.ScrollView:FindFirstChild("OffsetFrame")) then
                for _, v22 in ipairs(l_current_0.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
                    if v22.ClassName == "Frame" and v22.LayoutOrder <= v9.selectedIndex then
                        v20 = v20 + v22.AbsoluteSize.Y;
                        if v22.LayoutOrder == v9.selectedIndex then
                            v19 = v22.AbsoluteSize.Y;
                        end;
                    end;
                end;
            end;
            local l_Y_0 = v10.current.CanvasPosition.Y;
            local v24 = l_Y_0 + v18;
            local v25 = v20 - v19;
            local l_l_Y_0_0 = l_Y_0;
            if v24 < v20 then
                l_l_Y_0_0 = v20 - v18;
            end;
            if v25 < l_Y_0 then
                l_l_Y_0_0 = v25;
            end;
            return Vector2.new(0, l_l_Y_0_0);
        end;
    end;
    local v28 = nil;
    local v29 = false;
    local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
    if l_ChatWindowConfiguration_0 then
        v28 = l_ChatWindowConfiguration_0.VerticalAlignment;
        v29 = l_ChatWindowConfiguration_0.Enabled;
    end;
    local v31 = false;
    if v28 == Enum.VerticalAlignment.Top then
        v31 = not v29;
    end;
    local v32 = v9.textBoxRef.current and v9.textBoxRef.current.AbsoluteSize.Y + 20;
    local v33 = (not not v9.autocompleteDropdownRef.current and v9.autocompleteDropdownRef.current:FindFirstAncestor("appLayout")) and v9.autocompleteDropdownRef.current:FindFirstAncestor("appLayout").chatWindow or nil;
    return v3.createElement("Frame", {
        AnchorPoint = not not v31 and Vector2.new(0, 0) or Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.95, 0, 0, #v9.results > 3 and v7.AutocompleteFrameDefaultSizeY or #v9.results * v7.AutocompleteEntryDefaultSizeY), 
        Position = UDim2.new(0, 0, 0, not not v31 and v32 or 0), 
        ZIndex = 2, 
        Visible = v9.activated and #v9.results > 0, 
        ref = v9.autocompleteDropdownRef
    }, {
        UISizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v7.ChatWindowMaxWidth, not (not v33 or v31) and v33.AbsoluteSize.Y or math.huge)
        }), 
        ScrollBarFrame = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v9.setTransparency(0, v9.transparencyValue), 
            BackgroundColor3 = v9.chatInputBarSettings.BackgroundColor3, 
            ZIndex = 2
        }, {
            Border = v3.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v7.ChatInputBarBorderColor3, 
                Transparency = v9.setTransparency(v7.ChatInputBarBorderTransparency, v9.transparencyValue)
            }), 
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }), 
            ScrollViewFrame = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                ZIndex = 2
            }, {
                ScrollView = v3.createElement("ScrollingFrame", {
                    Size = UDim2.new(1, -4, 1, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(0, 0, 0, #v9.results * v7.AutocompleteEntryDefaultSizeY), 
                    CanvasPosition = v27(), 
                    BackgroundTransparency = 1, 
                    ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                    ScrollBarImageTransparency = v9.setTransparency(0, v9.transparencyValue), 
                    BorderSizePixel = 0, 
                    ScrollBarThickness = 4, 
                    VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                    ClipsDescendants = false, 
                    Selectable = true, 
                    ZIndex = 2, 
                    ref = v10
                }, {
                    OffsetFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 8, 1, 0), 
                        BackgroundTransparency = 1
                    }, v16(v9.results))
                })
            })
        })
    });
end;
