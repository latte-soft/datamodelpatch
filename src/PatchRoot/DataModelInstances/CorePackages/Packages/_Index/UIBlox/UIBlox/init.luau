local v0 = require(script.Core.Config.makeConfigurable);
local v1 = require(script.UIBloxDefaultConfig);
local _ = require(script.App.Style.Fonts);
local _ = require(script.App.ImageSet.ImagesTypes);
local _ = require(script.App.Style.StyleTypes);
local _ = require(script.Core.Layout.Responsive.ResponsiveLayoutConfigReader);
local v6 = require(script.App.Dialog.Overlay.Overlay);
local v7 = require(script.Parent.ReactUtils);
return v0(function(v8)
    local v9 = require(script.Utility.strict);
    local v10 = {
        Core = v9({
            Layout = v9({
                Responsive = v9({
                    ResponsiveLayoutProvider = require(script.Core.Layout.Responsive.ResponsiveLayoutProvider), 
                    ResponsiveRow = require(script.Core.Layout.Responsive.ResponsiveRow), 
                    useResponsiveLayout = require(script.Core.Layout.Responsive.useResponsiveLayout)
                }), 
                Grid = v9({
                    GridContainer_DEPRECATED = require(script.Core.Layout.Grid.GridContainer_DEPRECATED), 
                    withGridConfig_DEPRECATED = require(script.Core.Layout.Grid.withGridConfig_DEPRECATED)
                }), 
                LayerCollector = v9({
                    LayerCollectorProvider = require(script.Core.Layout.LayerCollector.LayerCollectorProvider), 
                    withLayerCollectorProvider = require(script.Core.Layout.LayerCollector.withLayerCollectorProvider), 
                    useLayerCollector = require(script.Core.Layout.LayerCollector.useLayerCollector)
                })
            }), 
            Animation = v9({
                withAnimation = require(script.Core.Animation.withAnimation)
            }), 
            ImageSet = v9({
                ImageSetButton = require(script.Core.ImageSet.ImageSetComponent).Button, 
                ImageSetLabel = require(script.Core.ImageSet.ImageSetComponent).Label, 
                Validator = v9({
                    validateImage = require(script.Core.ImageSet.Validator.validateImage)
                })
            }), 
            Control = v9({
                Enum = v9({
                    ControlState = require(script.Core.Control.Enum.ControlState), 
                    ControlStateEvent = require(script.Core.Control.Enum.ControlStateEvent), 
                    SelectionMode = require(script.Core.Control.Enum.SelectionMode)
                }), 
                Hooks = v9({
                    useGuiControlState = require(script.Core.Control.Hooks.useGuiControlState), 
                    useGuiControlStateWithBinding = require(script.Core.Control.Hooks.useGuiControlStateWithBinding)
                }), 
                Interactable = require(script.Core.Control.Interactable), 
                InteractableList = require(script.Core.Control.InteractableList), 
                StateLayer = require(script.Core.Control.StateLayer), 
                FeedbackManagerInjectionContext = require(script.Core.Control.FeedbackManagerInjectionContext)
            }), 
            Spatial = v9({
                SurfaceGuiWithAdornee = require(script.Core.Spatial.SurfaceGuiWithAdornee)
            }), 
            Style = v9({
                Provider = require(script.Core.Style.StyleProvider), 
                withStyle = require(script.Core.Style.withStyle), 
                useStyle = require(script.Core.Style.useStyle)
            }), 
            VR = v9({
                Panel3D = require(script.Core.VR.Panel3D), 
                Constants = require(script.Core.VR.Constants), 
                PointerOverlay = require(script.Core.VR.PointerOverlay)
            }), 
            Text = v9({
                ExpandableText = v9({
                    GetCanExpand = require(script.Core.Text.ExpandableText.ExpandableTextUtils).getCanExpand
                }), 
                GetWrappedTextWithIcon = require(script.Core.Text.GetWrappedTextWithIcon), 
                EmojiTextLabel = require(script.Core.Text.EmojiTextLabel.EmojiTextLabel)
            }), 
            Hooks = v9({
                useExternalEvent = v7.useEventConnection, 
                useLazyRef = v7.useLazyRef, 
                useInitializedValue = v7.useInitializedValue, 
                useForwardRef = v7.useForwardRef, 
                useProperties = v7.useProperties, 
                usePropertiesDeferred = v7.usePropertiesDeferred, 
                useIsGamepad = require(script.Utility.useIsGamepad), 
                useInputType = require(script.Utility.useInputType)
            }), 
            Enums = v9({
                InputType = require(script.Enums.InputType)
            })
        }), 
        Common = v9({
            Style = v9({
                ColorSystem = require(script.Common.Style.ColorSystem)
            })
        }), 
        App = v9({
            Context = v9({
                ContentProvider = require(script.App.Context.ContentProvider)
            }), 
            ImageSet = v9({
                Images = require(script.App.ImageSet.Images), 
                getIconSize = require(script.App.ImageSet.getIconSize), 
                getIconSizeUDim2 = require(script.App.ImageSet.getIconSizeUDim2), 
                scaleSliceToResolution = require(script.App.ImageSet.scaleSliceToResolution), 
                Enum = v9({
                    IconSize = require(script.App.ImageSet.Enum.IconSize)
                })
            }), 
            Bar = v9({
                HeaderBar = require(script.App.Bar.HeaderBar), 
                FullscreenTitleBar = require(script.App.Bar.FullscreenTitleBar), 
                ControllerBar = require(script.App.Bar.ControllerBar)
            }), 
            Button = v9({
                Enum = v9({
                    ButtonType = require(script.App.Button.Enum.ButtonType), 
                    StandardButtonSize = require(script.Core.Button.Enum.StandardButtonSize)
                }), 
                Button = require(script.App.Button.Button), 
                ButtonStack = require(script.App.Button.ButtonStack), 
                TextButton = require(script.App.Button.TextButton), 
                LinkButton = require(script.App.Button.LinkButton), 
                IconButton = require(script.App.Button.IconButton), 
                ActionBar = require(script.App.Button.ActionBar), 
                UtilityActionIcon = require(script.App.Button.UtilityActionIcon)
            }), 
            Cell = v9({
                Small = v9({
                    SelectionGroup = v9({
                        SmallRadioButtonGroup = require(script.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup)
                    })
                })
            }), 
            Text = v9({
                ExpandableTextArea = require(script.App.Text.ExpandableTextArea.ExpandableTextArea), 
                StyledTextLabel = require(script.App.Text.StyledTextLabel)
            }), 
            Loading = v9({
                Enum = v9({
                    RetrievalStatus = require(script.App.Loading.Enum.RetrievalStatus), 
                    LoadingStrategy = require(script.App.Loading.Enum.LoadingStrategy)
                }), 
                LoadableImage = require(script.App.Loading.LoadableImage), 
                ShimmerPanel = require(script.App.Loading.ShimmerPanel), 
                LoadingSpinner = require(script.App.Loading.LoadingSpinner)
            }), 
            InputButton = v9({
                RadioButtonList = require(script.App.InputButton.RadioButtonList), 
                CheckboxList = require(script.App.InputButton.CheckboxList), 
                Checkbox = require(script.App.InputButton.Checkbox), 
                Toggle = require(script.App.InputButton.Toggle)
            }), 
            Container = v9({
                Enum = v9({
                    ScrollBarType = require(script.App.Container.Enum.ScrollBarType)
                }), 
                Carousel = v9({
                    ResponsiveCarousel = require(script.App.Container.Carousel.ResponsiveCarousel), 
                    FreeFlowCarousel = require(script.App.Container.Carousel.FreeFlowCarousel)
                }), 
                Grid = v9({
                    ResponsiveGrid = require(script.App.Container.Grid.ResponsiveGrid)
                }), 
                VerticalScrollView = require(script.App.Container.VerticalScrollView), 
                VerticalScrollViewWithMargin = require(script.App.Container.VerticalScrollViewWithMargin), 
                getPageMargin = require(script.App.Container.getPageMargin), 
                LoadingStateContainer = require(script.App.Container.LoadingStateContainer), 
                LoadingStatePage = require(script.App.Container.LoadingStatePage), 
                HorizontalPageMargin = require(script.App.Container.HorizontalPageMargin), 
                MediaGalleryPreview = require(script.App.Container.MediaGallery.MediaGalleryPreview), 
                MediaGalleryFullScreen = require(script.App.Container.MediaGallery.MediaGalleryFullScreen), 
                MediaGalleryHorizontal = require(script.App.Container.MediaGallery.MediaGalleryHorizontal), 
                MediaGalleryExpandableView = require(script.App.Container.MediaGallery.MediaGalleryExpandableView), 
                CrossFadeAnimatedView = require(script.App.Container.MediaGallery.CrossFadeAnimatedView)
            }), 
            Slider = v9({
                ContextualSlider = require(script.App.Slider.ContextualSlider), 
                SystemSlider = require(script.App.Slider.SystemSlider), 
                TwoKnobSystemSlider = require(script.App.Slider.TwoKnobSystemSlider), 
                TwoKnobContextualSlider = require(script.App.Slider.TwoKnobContextualSlider)
            }), 
            Emoji = v9({
                Emoji = require(script.Core.Emoji.Emoji), 
                Enum = v9({
                    Emoji = require(script.Core.Emoji.Enum.Emoji)
                })
            }), 
            Grid = v9({
                GridView = require(script.App.Grid.GridView), 
                GridMetrics = require(script.App.Grid.GridMetrics), 
                DefaultMetricsGridView = require(script.App.Grid.DefaultMetricsGridView)
            }), 
            Tile = v9({
                MenuTile = require(script.App.Tile.MenuTile.MenuTile), 
                PlayerTile = require(script.App.Tile.PlayerTile.PlayerTile), 
                ExperienceTileV3 = require(script.App.Tile.SplitTile.ExperienceTile.ExperienceTileV3), 
                AspectRatioModeEnum = require(script.App.Tile.SplitTile.ExperienceTile.Enum.AspectRatioMode), 
                getExperienceTileHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileHeight), 
                getExperienceTileRelativeHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileRelativeHeight), 
                ExperienceActionRow = require(script.App.Tile.SplitTile.ExperienceTile.ExperienceActionRow), 
                ActionTile = require(script.App.Tile.SplitTile.ActionTile.ActionTile), 
                VerticalTile = require(script.App.Tile.SplitTile.VerticalTile.VerticalTile), 
                VerticalTileThumbnail = require(script.App.Tile.SplitTile.VerticalTile.VerticalTileThumbnail), 
                ExperienceTileMetadata = v9({
                    SocialProofFooter = require(script.App.Tile.ExperienceTileMetadata.SocialProofFooter), 
                    CoPlayFooter = require(script.App.Tile.ExperienceTileMetadata.CoPlayFooter), 
                    TextFooter = require(script.App.Tile.ExperienceTileMetadata.TextFooter)
                })
            }), 
            Dialog = v9({
                Modal = v9({
                    FullPageModal = require(script.App.Dialog.Modal.FullPageModal), 
                    PartialPageModal = require(script.App.Dialog.Modal.PartialPageModal), 
                    EducationalModal = require(script.App.Dialog.Modal.EducationalModal), 
                    ModalWindow = require(script.App.Dialog.Modal.ModalWindow)
                }), 
                Alert = v9({
                    InformativeAlert = require(script.App.Dialog.Alert.InformativeAlert), 
                    InteractiveAlert = require(script.App.Dialog.Alert.InteractiveAlert), 
                    LoadingAlert = require(script.App.Dialog.Alert.LoadingAlert)
                }), 
                Enum = v9({
                    AlertType = require(script.App.Dialog.Alert.Enum.AlertType), 
                    TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation)
                }), 
                Toast = require(script.App.Dialog.Toast.Toast), 
                Tooltip = require(script.App.Dialog.Tooltip.Tooltip), 
                TooltipV2 = require(script.App.Dialog.TooltipV2.Controllers), 
                TooltipCallout = require(script.App.Dialog.TooltipV2.TooltipCallout), 
                TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation), 
                Overlay = v6
            }), 
            Constant = v9({
                IconSize = require(script.App.Constant.IconSize)
            }), 
            Style = v9({
                AppStyleProvider = require(script.App.Style.AppStyleProvider), 
                Colors = require(script.App.Style.Colors), 
                Constants = require(script.App.Style.Constants), 
                Themes = {
                    DarkTheme = if not v8.useNewThemeColorPalettes then require(script.App.Style.Themes.DarkTheme) else require(script.App.Style.Themes.DarkThemeNew), 
                    LightTheme = if not v8.useNewThemeColorPalettes then require(script.App.Style.Themes.LightTheme) else require(script.App.Style.Themes.LightThemeNew)
                }, 
                Tokens = require(script.App.Style.Tokens)
            }), 
            Indicator = v9({
                Badge = require(script.App.Indicator.Badge), 
                EmptyState = require(script.App.Indicator.EmptyState), 
                Enum = v9({
                    BadgeStates = require(script.App.Indicator.Enum.BadgeStates), 
                    BadgeVariant = require(script.App.Indicator.Enum.BadgeVariant), 
                    VoteStates = require(script.App.Indicator.Enum.VoteStates)
                }), 
                PlayerContext = require(script.App.Indicator.PlayerContext), 
                PlayerCount = require(script.App.Indicator.PlayerCount), 
                RateCount = require(script.App.Indicator.RateCount), 
                StatWidget = require(script.App.Indicator.StatWidget), 
                StatGroup = require(script.App.Indicator.StatGroup), 
                PlayerName = require(script.App.Indicator.PlayerName)
            }), 
            Menu = v9({
                BaseMenu = require(script.App.Menu.BaseMenu), 
                ContextualMenu = require(script.App.Menu.ContextualMenu), 
                MenuDirection = require(script.App.Menu.MenuDirection), 
                DropdownMenu = require(script.App.Menu.DropdownMenu), 
                KeyLabel = require(script.App.Menu.KeyLabel.KeyLabel)
            }), 
            Control = v9({
                SegmentedControl = require(script.App.Control.SegmentedControl), 
                Pill = require(script.App.Control.Pill.Pill), 
                Pillv2 = require(script.App.Control.Pill.Pillv2), 
                Slot = v9({
                    SlotTray = require(script.App.Control.Slot.SlotTray)
                }), 
                PillGroup = require(script.App.Control.Pill.PillGroup), 
                ScrollingListWithArrowsAndGradient = require(script.App.Control.HorizontalNav.ScrollingListWithArrowsAndGradient)
            }), 
            Navigation = v9({
                Enum = v9({
                    Placement = require(script.App.Navigation.Enum.Placement), 
                    NavigationBarAlignment = require(script.App.Navigation.Enum.NavigationBarAlignment), 
                    NavigationRailAlignment = require(script.App.Navigation.Enum.NavigationRailAlignment)
                }), 
                SystemBar = require(script.App.Navigation.SystemBar), 
                NavigationBar = require(script.App.Navigation.NavigationBar), 
                NavigationRail = require(script.App.Navigation.NavigationRail), 
                PrimaryNavBar = v9({
                    ContextBar = require(script.App.Navigation.PrimaryNavBar.ContextBar), 
                    IconTab = require(script.App.Navigation.PrimaryNavBar.IconTab), 
                    IconTabGroup = require(script.App.Navigation.PrimaryNavBar.IconTabGroup), 
                    Types = require(script.App.Navigation.PrimaryNavBar.Types)
                }), 
                ShortcutBar = require(script.App.Navigation.ShortcutBar.ShortcutBar)
            }), 
            SelectionImage = v9({
                SelectionCursorProvider = require(script.App.SelectionImage.SelectionCursorProvider), 
                CursorKind = require(script.App.SelectionImage.CursorKind), 
                withSelectionCursorProvider = require(script.App.SelectionImage.withSelectionCursorProvider), 
                useSelectionCursor = require(script.App.SelectionImage.useSelectionCursor)
            }), 
            SelectionCursor = v9({
                CursorProvider = require(script.App.SelectionCursor.CursorProvider), 
                useCursor = require(script.App.SelectionCursor.useCursor), 
                withCursor = require(script.App.SelectionCursor.withCursor), 
                useCursorByType = require(script.App.SelectionCursor.useCursorByType), 
                CursorType = require(script.App.SelectionCursor.CursorType)
            }), 
            Template = v9({
                DetailsPage = {
                    Enum = {
                        ContentPosition = require(script.App.Template.DetailsPage.Enum.ContentPosition)
                    }, 
                    DetailsPageTemplate = require(script.App.Template.DetailsPage.DetailsPageTemplate), 
                    DetailsPageSelector = require(script.App.Template.DetailsPage.DetailsPageSelector)
                }
            }), 
            Table = v9({
                ListTable = require(script.App.Table.ListTable), 
                ScrollingListTable = require(script.App.Table.ScrollingListTable), 
                Cell = require(script.App.Table.Cell), 
                CellHeadDetail = require(script.App.Table.CellHeadDetail), 
                CellTailDescription = require(script.App.Table.CellTailDescription)
            }), 
            Input = v9({
                TextField = require(script.App.Input.TextField)
            })
        }), 
        UnitTestHelpers = {
            MockContentProvider = require(script.UnitTestHelpers.MockContentProvider), 
            mockStyleComponent = require(script.Utility.mockStyleComponent), 
            testWithStyledComponent = require(script.UnitTestHelpers.testWithStyledComponent)
        }
    };
    v10.Style = {
        Provider = v10.Core.Style.Provider, 
        withStyle = v10.Core.Style.withStyle, 
        Validator = {
            validateStyle = require(script.App.Style.Validator.validateStyle), 
            validateFont = require(script.App.Style.Validator.validateFont), 
            validateFontInfo = require(script.Core.Style.Validator.validateFontInfo), 
            validateTypographyInfo = require(script.Core.Style.Validator.validateTypographyInfo), 
            validateTheme = if not v8.useNewThemeColorPalettes then require(script.App.Style.Validator.validateTheme) else require(script.App.Style.Validator.validateThemeNew), 
            validateColorInfo = require(script.Core.Style.Validator.validateColorInfo), 
            validateColorToken = require(script.Core.Style.Validator.validateColorToken)
        }, 
        Consumer = require(script.Core.Style.StyleConsumer), 
        Context = require(script.Core.Style.StyleContext)
    };
    v10.AccordionView = require(script.App.Accordion.AccordionView);
    v10.Tile = {
        SaveTile = require(script.App.Tile.SaveTile.SaveTile), 
        ItemTile = require(script.App.Tile.ItemTile.ItemTile), 
        ItemTileEnums = require(script.App.Tile.Enum.ItemTileEnums)
    };
    v10.Utility = {
        ExternalEventConnection = v7.EventConnection, 
        SpringAnimatedItem = require(script.Utility.SpringAnimatedItem)
    };
    v10.ModalBottomSheet = require(script.ModalBottomSheet.ModalBottomSheet);
    if _G.__UIBLOX_TRACK_USAGE__ then
        local v11 = require(script.Parent.UsageTracker);
        v10 = v11.trackMemberAccess("UIBlox", v10, v11.isReactComponent);
    end;
    if v8.enableTraceLevelLog then
        require(script.Logger):enableTraceLog();
    end;
    return v10;
end, "UIBlox", v1);
