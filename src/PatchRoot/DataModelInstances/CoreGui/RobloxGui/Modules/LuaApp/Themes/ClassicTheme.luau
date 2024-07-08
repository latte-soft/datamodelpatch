local l_CorePackages_0 = game:GetService("CorePackages");
local l_Color_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Color;
local v2 = require(script.Parent.Colors);
local v3 = require(script.Parent.Parent.Enum.ButtonState);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = {
    Name = "classic", 
    Color = {
        Background = v2.Gray4
    }, 
    ContextPrimaryButton = {
        Color = v2.Green, 
        Transparency = 0, 
        DisabledColor = v2.Green, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v2.Green, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v2.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }
    }, 
    SystemPrimaryButton = {
        Color = v2.Black, 
        Transparency = 0, 
        DisabledColor = v2.Black, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v2.Black, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v2.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }, 
        ShimmerAnimation = {
            Transparency = 0.65, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png", 
            AspectRatio = 0.876
        }
    }, 
    SecondaryButton = {
        Color = v2.BluePrimary, 
        Transparency = 0, 
        HoverColor = v2.BlueHover, 
        OnPressColor = v2.BlueHover, 
        OnPressTransparency = 0, 
        DisabledColor = v2.BlueDisabled, 
        DisabledTransparency = 0, 
        Text = {
            Color = v2.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }
    }, 
    IconButton = {
        Fill = {
            Off = {
                Color = v2.Black, 
                Transparency = 0.9
            }, 
            On = {
                Color = v2.Black, 
                Transparency = 1
            }, 
            OnPress = {
                Color = v2.Black, 
                Transparency = 0.95
            }, 
            Loading = {
                Color = v2.Black, 
                Transparency = 0.9
            }, 
            Disabled = {
                Color = v2.Black, 
                Transparency = 0.95
            }
        }, 
        Border = {
            Off = {
                Color = v2.Black, 
                Transparency = 0.5
            }, 
            On = {
                Color = v2.Black, 
                Transparency = 0.5
            }, 
            OnPress = {
                Color = v2.Black, 
                Transparency = 0.75
            }, 
            Loading = {
                Color = v2.Black, 
                Transparency = 0.5
            }, 
            Disabled = {
                Color = v2.Black, 
                Transparency = 0.75
            }
        }, 
        Icon = {
            Off = {
                Color = v2.Black, 
                Transparency = 0.5
            }, 
            On = {
                Color = v2.Green, 
                Transparency = 0
            }, 
            OnPress = {
                Color = v2.Green, 
                Transparency = 0.5
            }, 
            Loading = {
                Color = v2.Black, 
                Transparency = 0.5
            }, 
            Disabled = {
                Color = v2.Black, 
                Transparency = 0.5
            }
        }
    }, 
    EmptyStatePage = {
        ErrorMessage = {
            Color = v2.Gray3
        }
    }, 
    RetryButton = {
        Color = v2.Gray1, 
        DisabledColor = v2.Gray3, 
        DisabledTransparency = 0
    }, 
    ShimmerAnimation = {
        Transparency = 0, 
        Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_lightTheme.png", 
        AspectRatio = 0.876
    }, 
    ShimmerPanel = {
        Color = v2.Alabaster, 
        Transparency = 0.5
    }, 
    ContextualMenu = {
        Cells = {
            Icon = {
                Color = v2.Gray1, 
                OnColor = v2.Green, 
                Transparency = 0.5, 
                OnTransparency = 0, 
                DisabledTransparency = 0.5
            }, 
            Content = {
                Color = v2.Gray1, 
                DisabledColor = v2.Gray1, 
                DisabledTransparency = 0.5
            }, 
            Background = {
                OnPressColor = v2.Black, 
                OnPressTransparency = 0.9
            }
        }, 
        Background = {
            Color = v2.White
        }, 
        Title = {
            Color = v2.Black, 
            Transparency = 0, 
            DisabledTransparency = 0.5
        }, 
        Divider = {
            Color = v2.Gray4
        }, 
        Cancel = {
            Color = v2.Gray1
        }, 
        DarkOverlay = {
            Color = v2.Gray1, 
            Transparency = 0.5
        }
    }, 
    Authentication = {
        WeChatButton = {
            Text = {
                Font = l_AppFonts_0.default:getBold(), 
                Size = 18, 
                Color = v2.White
            }, 
            Background = {
                Color = v2.Green2
            }
        }
    }, 
    AlertWindow = {
        Background = {
            Color = v2.White
        }, 
        Title = {
            Color = v2.Black, 
            Font = l_AppFonts_0.default:getBold()
        }, 
        Message = {
            Color = v2.Gray1, 
            Font = l_AppFonts_0.default:getDefault()
        }, 
        Divider = {
            Color = v2.Gray4
        }, 
        Button = {
            Font = l_AppFonts_0.default:getDefault()
        }
    }, 
    GameDetails = {
        Background = {
            Color = v2.Black, 
            Transparency = 0.3
        }, 
        Text = {
            Font = Enum.Font.SourceSans, 
            BoldFont = Enum.Font.SourceSansBold, 
            Color = {
                Main = v2.White, 
                Secondary = v2.Pumice
            }
        }, 
        GameBasicStats = {
            Color = v2.White, 
            Transparency = 0.3, 
            Font = Enum.Font.SourceSans
        }, 
        GameInfoList = {
            DividerColor = v2.Graphite, 
            Cells = {
                Background = {
                    Color = v2.Black, 
                    Transparency = {
                        Default = 1, 
                        Pressed = 0.7
                    }
                }
            }
        }, 
        Rating = {
            Background = {
                Color = v2.White, 
                Transparency = 0.7
            }
        }, 
        Carousel = {
            Text = {
                Color = v2.Flint
            }
        }, 
        TopBar = {
            Icon = {
                Color = v2.Slate
            }
        }, 
        LoadingView = {
            BackgroundImage = {
                Image = "rbxasset://textures/ui/LuaApp/graphic/GameDetailsBackground/loadingBkg_base.jpg", 
                Size = Vector2.new(500, 500), 
                Tint = {
                    Color = v2.Ash, 
                    Transparency = 0.45
                }
            }
        }, 
        SocialMediaButton = {
            Transparency = 0, 
            OnPressTransparency = 0.5
        }
    }, 
    GameMediaAccordion = {
        Item = {
            BackgroundColor = v2.Flint, 
            BackgroundTransparency = 0.5
        }, 
        FakeItem = {
            Loading = {
                Color = v2.Flint, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }, 
            Loaded = {
                Color = v2.White, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }
        }, 
        VideoIconColor = v2.White
    }, 
    GameCard = {
        Background = {
            Color = v2.White, 
            Transparency = 0
        }, 
        Sponsor = {
            Color = v2.Gray3, 
            TextColor = v2.White, 
            Font = Enum.Font.SourceSans
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Color = v2.Gray1
        }, 
        GameBasicStats = {
            Color = v2.Gray2, 
            Transparency = 0, 
            Font = Enum.Font.SourceSans
        }
    }, 
    ChatTopBar = {
        Background = {
            Color = v2.ChatTopBarBluePressed, 
            Transparency = 0
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Size = 23, 
            Color = v2.White
        }, 
        Subtitle = {
            Font = Enum.Font.SourceSans, 
            Size = 15, 
            Color = v2.White
        }
    }, 
    BottomBar = {
        Background = {
            Color = v2.White, 
            Transparency = 0
        }, 
        TopBorder = {
            Color = v2.Gray4, 
            Transparency = 0
        }
    }, 
    BottomBarButton = {
        Icon = {
            Off = {
                Color = v2.Flint, 
                Transparency = 0.5
            }, 
            On = {
                Color = v2.Flint, 
                Transparency = 0
            }
        }, 
        Title = {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = 14
        }
    }, 
    NumericalBadge = {
        Text = {
            Font = l_AppFonts_0.default:getMedium(), 
            Color = v2.White, 
            Size = 12
        }, 
        Border = {
            Default = {
                Color = v2.Red, 
                Transparency = 1
            }, 
            AppChrome = {
                Color = v2.Red, 
                Transparency = 1
            }
        }, 
        Inner = {
            Color = v2.Red, 
            Transparency = 0
        }
    }, 
    MorePage = {
        Background = {
            Color = v2.Gray6, 
            Transparency = 0
        }, 
        List = {
            Background = {
                Color = v2.White, 
                Transparency = 0
            }, 
            Divider = {
                Color = v2.Gray4, 
                Transparency = 0
            }
        }, 
        Button = {
            Background = {
                Default = {
                    Color = v2.White, 
                    Transparency = 0
                }, 
                Pressed = {
                    Color = v2.Gray5, 
                    Transparency = 0
                }
            }, 
            Text = {
                Font = Enum.Font.SourceSans, 
                Size = 23, 
                Color = v2.Black, 
                Transparency = 0
            }, 
            Icon = {
                Color = v2.White, 
                Transparency = 0
            }, 
            RightImage = {
                Color = v2.White, 
                Transparency = 0
            }
        }, 
        Footer = {
            Font = Enum.Font.SourceSans, 
            Size = 18, 
            Color = v2.Black, 
            Transparency = 0
        }
    }, 
    EventsPage = {
        Text = {
            Font = Enum.Font.SourceSans, 
            Size = 23, 
            Color = v2.Gray3, 
            Transparency = 0
        }
    }, 
    TencentNoticeCenter = {
        Text = {
            Font = Enum.Font.SourceSans, 
            Size = 23, 
            Color = v2.Gray3, 
            Transparency = 0
        }
    }, 
    PremiumIcon = {
        Color = v2.Black, 
        Transparency = 0
    }, 
    Main = {
        Background = {
            Color = v2.Gray4
        }, 
        Foreground = {
            Color = v2.White
        }, 
        TitleText = {
            Color = v2.Gray1
        }, 
        BodyText = {
            Font = Enum.Font.SourceSans, 
            Color = v2.Gray2
        }, 
        Divider = {
            Color = v2.Gray4
        }
    }, 
    TopBar = {
        Bar = {
            Color = v2.BluePressed
        }, 
        Background = {
            Color = v2.BluePressed
        }, 
        DarkOverlay = {
            Color = v2.Black, 
            Transparency = 0.3
        }, 
        Text = {
            Color = v2.White, 
            Transparency = 0
        }, 
        Icon = {
            Color = v2.White
        }, 
        Badge = {
            Color = v2.Red
        }, 
        BadgeText = {
            Color = v2.White
        }, 
        Separator = {
            Color = v2.BluePressed
        }
    }, 
    SearchBar = {
        Background = {
            Color = v2.White
        }, 
        Placeholder = {
            Color = v2.Gray2
        }, 
        Content = {
            Color = v2.Gray2
        }
    }, 
    DropDownList = {
        [v3.Default] = {
            Background = {
                Color = v2.White
            }, 
            Content = {
                Color = v2.Gray2
            }, 
            Border = {
                Color = v2.Black
            }
        }
    }, 
    ListPickerItem = {
        [v3.Default] = {
            Background = {
                Color = v2.White
            }, 
            Content = {
                Color = v2.Gray2, 
                Transparency = 0
            }, 
            Separator = {
                Color = v2.Gray4
            }
        }, 
        [v3.Pressed] = {
            Background = {
                Color = Color3.fromRGB(242, 242, 242)
            }
        }
    }, 
    Buttons = {}
};
v6.Buttons.CtaButton = {
    TextFont = Enum.Font.SourceSans, 
    [v3.Default] = {
        Background = {
            Color = l_Color_0.Color3FromHex(178007), 
            Transparency = 0
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(16777215), 
            Transparency = 0
        }
    }, 
    [v3.Pressed] = {
        Background = {
            Color = l_Color_0.Color3FromHex(4179577)
        }
    }, 
    [v3.Hover] = {
        Background = {
            Color = l_Color_0.Color3FromHex(4179577)
        }
    }, 
    [v3.Disabled] = {
        Background = {
            Color = l_Color_0.Color3FromHex(10740413)
        }
    }
};
v6.Buttons.GrowthButton = v6.Buttons.CtaButton;
v6.Buttons.SecondaryButton = {
    TextFont = Enum.Font.SourceSans, 
    [v3.Default] = {
        Background = {
            Color = l_Color_0.Color3FromHex(41727)
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(16777215), 
            Transparency = 0
        }
    }, 
    [v3.Pressed] = {
        Background = {
            Color = l_Color_0.Color3FromHex(3323391)
        }
    }, 
    [v3.Hover] = {
        Background = {
            Color = l_Color_0.Color3FromHex(3323391)
        }
    }, 
    [v3.Disabled] = {
        Background = {
            Color = l_Color_0.Color3FromHex(10083071)
        }
    }
};
v6.Buttons.ControlButton = {
    TextFont = Enum.Font.SourceSans, 
    [v3.Default] = {
        Background = {
            Color = l_Color_0.Color3FromHex(16777215)
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(1644825), 
            Transparency = 0
        }
    }, 
    [v3.Disabled] = {
        Content = {
            Color = l_Color_0.Color3FromHex(12105912), 
            Transparency = 0.5
        }
    }
};
v6.Buttons.AlertButton = {
    TextFont = Enum.Font.SourceSans, 
    [v3.Default] = {
        Background = {
            Color = l_Color_0.Color3FromHex(14182504)
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(16777215), 
            Transparency = 0
        }
    }, 
    [v3.Hover] = {
        Background = {
            Color = l_Color_0.Color3FromHex(14841462)
        }
    }
};
v6.Buttons.BuyButtons = {
    TextFont = Enum.Font.SourceSans, 
    [v3.Default] = {
        Background = {
            Color = l_Color_0.Color3FromHex(16777215)
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(1644825), 
            Transparency = 0
        }
    }, 
    [v3.Pressed] = {
        Background = {
            Color = l_Color_0.Color3FromHex(4179577)
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(16777215)
        }
    }, 
    [v3.Hover] = {
        Background = {
            Color = l_Color_0.Color3FromHex(4179577)
        }, 
        Content = {
            Color = l_Color_0.Color3FromHex(16777215)
        }
    }, 
    [v3.Disabled] = {
        Content = {
            Color = l_Color_0.Color3FromHex(16777215), 
            Transparency = 0.5
        }
    }
};
v6.Buttons.ToggleButton = {
    TextFont = Enum.Font.SourceSans, 
    On = {
        [v3.Default] = {
            Background = {
                Color = l_Color_0.Color3FromHex(16777215)
            }, 
            Border = {
                Transparency = 1
            }, 
            Content = {
                Color = l_Color_0.Color3FromHex(1644825), 
                Transparency = 0
            }
        }, 
        [v3.Pressed] = {
            Background = {
                Color = l_Color_0.Color3FromHex(14211288)
            }
        }
    }, 
    Off = {
        [v3.Default] = {
            Background = {
                Color = l_Color_0.Color3FromHex(16777215)
            }, 
            Border = {
                Transparency = 1
            }, 
            Content = {
                Color = l_Color_0.Color3FromHex(1644825), 
                Transparency = 0
            }
        }, 
        [v3.Pressed] = {
            Background = {
                Color = l_Color_0.Color3FromHex(14211288)
            }
        }
    }
};
v6.Buttons.AgreementButton = {
    Text = {
        Font = l_AppFonts_0.default:getDefault(), 
        Color = v2.Pumice
    }
};
v6.Widget = {
    Header = {
        Text = {
            Font = l_AppFonts_0.default:getBold(), 
            Color = v2.White
        }
    }, 
    Background = {
        [l_FormFactor_0.UNKNOWN] = {
            Color = v2.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.WIDE] = {
            Color = v2.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.COMPACT] = {
            Color = v2.Black, 
            Transparency = 0.3
        }
    }, 
    ContentText = {
        Color = v2.Pumice, 
        Font = Enum.Font.SourceSans
    }
};
v6.IconCards = {
    Text = {
        Color = v2.Pumice, 
        Font = Enum.Font.SourceSans
    }
};
v6.ScrollingFrameWithScrollBar = {
    ScrollBar = {
        Color = v2.Gray3, 
        Transparency = 0.7
    }
};
return v6;
