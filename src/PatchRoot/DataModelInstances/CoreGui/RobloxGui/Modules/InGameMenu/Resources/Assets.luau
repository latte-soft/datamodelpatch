local l_UIBlox_0 = require(game:GetService("CorePackages").InGameMenuDependencies).UIBlox;
local v1 = require(script.Parent.Images);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
return {
    Images = {
        RobloxLogo = v1["LuaApp/graphic/ic_logo"], 
        CloseButton = "rbxasset://textures/ui/TopBar/close.png", 
        RespawnIcon = v1["InGameMenu/Icons/RespawnIcon"], 
        ReportIcon = v1["LuaApp/icons/GameDetails/feedback"], 
        CloseModal = v1["LuaApp/icons/navigation/close"], 
        NavigateBack = v1["LuaApp/icons/navigation/pushBack"], 
        NavigateForward = v1["LuaApp/icons/navigation/pushRight"], 
        SendInvite = v1["LuaApp/icons/GameDetails/invite"], 
        InviteSuccess = v1["LuaApp/icons/status_progress"], 
        InviteMenu = v1["InGameMenu/Icons/MenuFriends"], 
        InviteFail = v1["LuaApp/graphic/ic_alert"], 
        ControlsMenu = v1["InGameMenu/Icons/MenuControls"], 
        Gamepad = "rbxasset://textures/ui/InGameMenu/GenericController.png", 
        GamepadXbox = "rbxasset://textures/ui/InGameMenu/XboxController.png", 
        GamepadQuest = "rbxassetid://13262267483", 
        KeyBorder = v1["InGameMenu/Icons/KeyBorder"], 
        Mouse1Press = v1["InGameMenu/Graphic/ClickLeft"], 
        Mouse2Press = v1["InGameMenu/Graphic/ClickRight"], 
        MouseWheelScroll = v1["InGameMenu/Graphic/WheelScroll"], 
        UpArrow = v1["InGameMenu/Icons/ArrowUp"], 
        DownArrow = v1["InGameMenu/Icons/ArrowDown"], 
        LeftArrow = v1["InGameMenu/Icons/ArrowLeft"], 
        RightArrow = v1["InGameMenu/Icons/ArrowRight"], 
        ScrollTop = "rbxasset://textures/ui/InGameMenu/ScrollTop.png", 
        ScrollMid = "rbxasset://textures/ui/InGameMenu/ScrollMiddle.png", 
        ScrollBottom = "rbxasset://textures/ui/InGameMenu/ScrollBottom.png", 
        RadialGlow = "rbxasset://textures/ui/InGameMenu/BackgroundGlow.png", 
        PlayersMenu = v1["InGameMenu/Icons/MenuPlayers"], 
        AddFriend = v1["LuaApp/graphic/actions_friends_addfriend"], 
        CancelFriendRequest = v1["InGameMenu/Icons/CancelFriendRequest"], 
        UnFriend = v1["InGameMenu/Icons/UnFriend"], 
        Friends = v1["InGameMenu/Icons/Friends"], 
        MoreActions = v1["LuaApp/icons/GameDetails/more"], 
        ViewAvatar = v1["InGameMenu/Icons/ViewAvatar"], 
        RoundedRect = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Image = l_Images_0["component_assets/circle_17"]
        }, 
        RoundedRectBorder = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Image = l_Images_0["component_assets/circle_17_stroke_1"]
        }, 
        WhiteSquare = {
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(0, 0, 0, 0), 
            Image = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png"
        }, 
        Circle = l_Images_0["component_assets/circle_29"], 
        CircleCutout = "rbxasset://textures/ui/InGameMenu/CircleCutout.png", 
        QuarterCircle = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png", 
        ExpandArrow = v1["InGameMenu/Icons/ExpandArrow"], 
        SelectedCheck = v1["InGameMenu/Icons/SelectedCheck"], 
        SuccessTick = v1["LuaApp/icons/status_progress"], 
        RetryIcon = v1["LuaApp/icons/common_refresh"], 
        ClearIcon = v1["InGameMenu/Icons/Clear"], 
        SearchIcon = v1["LuaApp/icons/ic-search-new"], 
        GameSettings = v1["InGameMenu/Icons/GameSettings"], 
        Shadow = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(12, 12, 40, 40), 
            Size = 8, 
            Image = v1["InGameMenu/9Slice/DropShadow"]
        }, 
        ToggleOutline = {
            Image = v1["InGameMenu/9Slice/ToggleOutline"], 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        }, 
        ToggleFill = {
            Image = v1["InGameMenu/9Slice/ToggleFill"], 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        }, 
        ToggleKnob = v1["InGameMenu/Graphic/SliderButton"], 
        SliderHover = v1["InGameMenu/Graphic/sliderHover"], 
        SliderCircle = {
            Image = v1["InGameMenu/9Slice/sliderCircle"], 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            ScaleType = Enum.ScaleType.Slice
        }, 
        SliderButton = v1["InGameMenu/Graphic/SliderButton"], 
        PlaceholderGameIcon = l_Images_0["icons/imageUnavailable"]
    }
};
