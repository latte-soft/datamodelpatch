local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_VoteFrame_0 = require(l_Shell_0:FindFirstChild("VoteFrame"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
return function()
    local v11 = {};
    local v12 = false;
    local v13 = nil;
    local v14 = 0;
    local v15 = 0;
    local v16 = nil;
    local v17 = nil;
    v11.Container = l_Utility_0.Create("Frame")({
        Name = "VoteContainer", 
        Size = UDim2.new(1, 0, 0, 114), 
        BackgroundTransparency = 1, 
        Visible = false
    });
    local v18 = l_Utility_0.Create("TextButton")({
        Name = "CannotVoteSelection", 
        Text = "", 
        Size = UDim2.new(1, 0, 0, 94), 
        Position = UDim2.new(0, 0, 0, 5), 
        BackgroundTransparency = 1, 
        Selectable = true, 
        SelectionImageObject = l_Utility_0.Create("ImageLabel")({
            Name = "SelectionImage", 
            Size = UDim2.new(1, 32, 1, 32), 
            Position = UDim2.new(0, -16, 0, -16), 
            Image = "rbxasset://textures/ui/SelectionBox.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(21, 21, 41, 41), 
            BackgroundTransparency = 1
        }); 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v19 = l_Utility_0.Create("TextLabel")({
        Name = "CannotVoteText", 
        Size = UDim2.new(0.8, 0, 1, 0), 
        Position = UDim2.new(0.1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Visible = false, 
        TextWrapped = true, 
        Text = l_LocalizedStrings_0:LocalizedString("CannotVoteWord"), 
        Parent = v18
    });
    local v20 = l_VoteFrame_0(v11.Container, UDim2.new(0, 88, 0, 34));
    local l_v20_Container_0 = v20:GetContainer();
    local v22 = l_Utility_0.Create("ImageLabel")({
        Name = "ThumbsUpImage", 
        Size = UDim2.new(0, 48, 0, 48), 
        BackgroundTransparency = 1
    });
    local v23 = v22:Clone();
    v23.Name = "ThumbsDownImage";
    local v24 = l_Utility_0.Create("ImageButton")({
        Name = "ThumbsUpButton", 
        Size = UDim2.new(0, v22.Size.X.Offset + 18, 0, v22.Size.Y.Offset + 18), 
        BackgroundTransparency = 1, 
        Image = "", 
        Parent = l_v20_Container_0; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    v24.Position = UDim2.new(0, -v24.Size.X.Offset - 12, 0, -v24.Size.Y.Offset / 2 + l_v20_Container_0.Size.Y.Offset / 2);
    local v25 = v24:Clone();
    v25.Name = "ThumbsDownButton";
    v25.Position = UDim2.new(1, 12, 0, v25.Position.Y.Offset);
    v25.Parent = l_v20_Container_0;
    v11.ThumbsUpButton = v24;
    v11.ThumbsDownButton = v25;
    v22.Parent = v24;
    v23.Parent = v25;
    v22.Position = UDim2.new(0.5, -v22.Size.X.Offset / 2, 0.5, -v22.Size.Y.Offset / 2);
    v23.Position = UDim2.new(0.5, -v23.Size.X.Offset / 2, 0.5, -v23.Size.Y.Offset / 2);
    local v26 = l_Utility_0.Create("TextLabel")({
        Name = "RatingText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, l_v20_Container_0.Position.X.Offset + l_v20_Container_0.Size.X.Offset / 2, 1, -20), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        Text = "", 
        Parent = v11.Container
    });
    local v27 = l_Utility_0.Create("TextLabel")({
        Name = "UpCountText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 43, 1, v26.Position.Y.Offset), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        TextColor3 = l_GlobalSettings_0.GreenTextColor, 
        Text = "", 
        Parent = v11.Container
    });
    local v28 = v27:Clone();
    v28.Name = "DownCountText";
    v28.Position = UDim2.new(0, 336, 1, v26.Position.Y.Offset);
    v28.TextColor3 = l_GlobalSettings_0.RedTextColor;
    v28.Parent = v11.Container;
    local function v32(v29, v30)
        v22.Image = v29 == true and "rbxasset://textures/ui/Shell/Icons/ThumbsUpFilled@1080.png" or "rbxasset://textures/ui/Shell/Icons/ThumbsUp@1080.png";
        v22.Size = UDim2.new(0, 48, 0, 48);
        v23.Image = v29 == false and "rbxasset://textures/ui/Shell/Icons/ThumbsDownFilled@1080.png" or "rbxasset://textures/ui/Shell/Icons/ThumbsDown@1080.png";
        v23.Size = UDim2.new(0, 48, 0, 48);
        v26.TextColor3 = (v29 == true and l_GlobalSettings_0.GreenTextColor or v29 == false and l_GlobalSettings_0.RedTextColor) or l_GlobalSettings_0.GreyTextColor;
        local v31 = if not v30 then v29 == true and "LikedWord" or (v29 == false and "DislikedWord" or nil) else "FirstToRateWord";
        v26.Text = not not v31 and l_LocalizedStrings_0:LocalizedString(v31) or "";
    end;
    local function v35(v33)
        local v34 = false;
        if v14 == 0 then
            v34 = v15 == 0;
        end;
        v20:SetPercentFilled(not v34 and v14 / (v14 + v15) or nil);
        v32(v33, v34);
        v27.Text = l_Utility_0.FormatNumberString(if not v34 then v14 else "");
        v28.Text = l_Utility_0.FormatNumberString(if not v34 then v15 else "");
        v24.Selectable = v12;
        v25.Selectable = v12;
        v18.Parent = not v12 and v11.Container.Parent or nil;
        v17 = not v12 and v18 or v24;
    end;
    local function _(v36, v37)
        if v36 == nil then
            l_UserData_0:IncrementVote();
        elseif v37 == nil then
            l_UserData_0:DecrementVote();
        end;
        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.VotedOnPlace);
    end;
    local v39 = false;
    local function v46(v40)
        if not v39 then
            v39 = true;
            local v41 = nil;
            local v42 = nil;
            if not v16 then
                v41 = false;
            else
                local v43, v44 = v16:PostVoteAsync(v40);
                v41 = v43;
                v42 = v44;
            end;
            if not v41 then
                if not v42 or not l_Errors_0.Vote[v42] then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
                else
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Vote[v42]), false);
                end;
            else
                local l_v13_0 = v13;
                if v40 == true then
                    v14 = v14 + 1;
                    if l_v13_0 == false then
                        v15 = v15 - 1;
                    end;
                elseif v40 == false then
                    v15 = v15 + 1;
                    if l_v13_0 == true then
                        v14 = v14 - 1;
                    end;
                elseif v40 == nil then
                    if l_v13_0 == true then
                        v14 = v14 - 1;
                    elseif l_v13_0 == false then
                        v15 = v15 - 1;
                    end;
                end;
                v13 = v40;
                v35(v40);
                if l_v13_0 == nil then
                    l_UserData_0:IncrementVote();
                elseif v40 == nil then
                    l_UserData_0:DecrementVote();
                end;
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.VotedOnPlace);
            end;
            v39 = false;
            return ;
        else
            return ;
        end;
    end;
    local function v47()
        v19.Visible = not v19.Visible;
        v11.Container.Visible = not v11.Container.Visible;
    end;
    v18.SelectionGained:connect(v47);
    v18.SelectionLost:connect(v47);
    v24.MouseButton1Click:connect(function()
        local v48 = true;
        if v13 == true then
            v48 = nil;
        end;
        v46(v48);
    end);
    v25.MouseButton1Click:connect(function()
        local v49 = false;
        if v13 == false then
            v49 = nil;
        end;
        v46(v49);
    end);
    v11.SetParent = function(v50, v51)
        v50.Container.Parent = v51;
        v35(v13);
    end;
    v11.SetPosition = function(v52, v53)
        v52.Container.Position = v53;
        v18.Position = UDim2.new(0, 0, 0, v52.Container.Position.Y.Offset + 5);
    end;
    v11.SetVisible = function(v54, v55)
        v54.Container.Visible = v55;
    end;
    v11.GetDefaultSelection = function(_)
        return v17;
    end;
    v11.SetCanVote = function(_, v58)
        v12 = v58;
        if v16 then
            v16:SetCanVote(v58);
        end;
        v35(v13);
    end;
    v11.GetCanVote = function(_)
        return v12;
    end;
    v11.InitializeAsync = function(_, v61)
        v16 = v61;
        local l_v61_VoteDataAsync_0 = v61:GetVoteDataAsync();
        if l_v61_VoteDataAsync_0 then
            v14 = l_v61_VoteDataAsync_0.UpVotes;
            v15 = l_v61_VoteDataAsync_0.DownVotes;
            v13 = l_v61_VoteDataAsync_0.UserVote;
            v12 = l_v61_VoteDataAsync_0.CanVote or l_v61_VoteDataAsync_0.CantVoteReason ~= "PlayGame";
        end;
        v35(v13);
        v20:SetVisible(true);
    end;
    return v11;
end;
