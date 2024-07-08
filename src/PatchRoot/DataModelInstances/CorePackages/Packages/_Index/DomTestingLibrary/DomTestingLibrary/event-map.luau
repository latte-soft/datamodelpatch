return {
    eventMap = {
        copy = {
            EventType = "ClipboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        cut = {
            EventType = "ClipboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        paste = {
            EventType = "ClipboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        compositionEnd = {
            EventType = "CompositionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        compositionStart = {
            EventType = "CompositionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        compositionUpdate = {
            EventType = "CompositionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        keyDown = {
            EventType = "KeyboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                charCode = 0, 
                composed = true
            }
        }, 
        keyPress = {
            EventType = "KeyboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                charCode = 0, 
                composed = true
            }
        }, 
        keyUp = {
            EventType = "KeyboardEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                charCode = 0, 
                composed = true
            }
        }, 
        focus = {
            EventType = "FocusEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false, 
                composed = true
            }
        }, 
        blur = {
            EventType = "FocusEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false, 
                composed = true
            }
        }, 
        focusIn = {
            EventType = "FocusEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        focusOut = {
            EventType = "FocusEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        change = {
            EventType = "Event", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        input = {
            EventType = "InputEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        invalid = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = true
            }
        }, 
        submit = {
            EventType = "Event", 
            defaultInit = {
                bubbles = true, 
                cancelable = true
            }
        }, 
        reset = {
            EventType = "Event", 
            defaultInit = {
                bubbles = true, 
                cancelable = true
            }
        }, 
        click = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                button = 0, 
                composed = true
            }
        }, 
        contextMenu = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        dblClick = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        drag = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        dragEnd = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        dragEnter = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        dragExit = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        dragLeave = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        dragOver = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        dragStart = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        drop = {
            EventType = "DragEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        mouseDown = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        mouseEnter = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false, 
                composed = true
            }
        }, 
        mouseLeave = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false, 
                composed = true
            }
        }, 
        mouseMove = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        mouseOut = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        mouseOver = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        mouseUp = {
            EventType = "MouseEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        select = {
            EventType = "Event", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        touchCancel = {
            EventType = "TouchEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        touchEnd = {
            EventType = "TouchEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        touchMove = {
            EventType = "TouchEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        touchStart = {
            EventType = "TouchEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        resize = {
            EventType = "UIEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        scroll = {
            EventType = "UIEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        wheel = {
            EventType = "WheelEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        abort = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        canPlay = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        canPlayThrough = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        durationChange = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        emptied = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        encrypted = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        ended = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        loadedData = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        loadedMetadata = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        loadStart = {
            EventType = "ProgressEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        pause = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        play = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        playing = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        progress = {
            EventType = "ProgressEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        rateChange = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        seeked = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        seeking = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        stalled = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        suspend = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        timeUpdate = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        volumeChange = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        waiting = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        load = {
            EventType = "UIEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        error = {
            EventType = "Event", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        animationStart = {
            EventType = "AnimationEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        animationEnd = {
            EventType = "AnimationEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        animationIteration = {
            EventType = "AnimationEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        transitionCancel = {
            EventType = "TransitionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        transitionEnd = {
            EventType = "TransitionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true
            }
        }, 
        transitionRun = {
            EventType = "TransitionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        transitionStart = {
            EventType = "TransitionEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }, 
        pointerOver = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        pointerEnter = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        pointerDown = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        pointerMove = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        pointerUp = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        pointerCancel = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        pointerOut = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = true, 
                composed = true
            }
        }, 
        pointerLeave = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = false, 
                cancelable = false
            }
        }, 
        gotPointerCapture = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        lostPointerCapture = {
            EventType = "PointerEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false, 
                composed = true
            }
        }, 
        popState = {
            EventType = "PopStateEvent", 
            defaultInit = {
                bubbles = true, 
                cancelable = false
            }
        }
    }, 
    eventAliasMap = {
        doubleClick = "dblClick"
    }
};
