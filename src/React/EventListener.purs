module React.EventListener
  ( HandlerOptions, WithOptions, withOptions
  -- , class IsHandler, eventListener
  ) where

import React (ReactClass, SyntheticEventHandler, unsafeCreateElement, ReactElement)
import React.SyntheticEvent
  ( SyntheticEvent, SyntheticAnimationEvent, SyntheticTransitionEvent, SyntheticClipboardEvent
  , SyntheticCompositionEvent, SyntheticKeyboardEvent, SyntheticFocusEvent, SyntheticInputEvent
  , SyntheticMouseEvent, SyntheticTouchEvent, SyntheticUIEvent, SyntheticWheelEvent
  )
import Web.Event.EventTarget (EventTarget)
import Data.Function.Uncurried (Fn2, runFn2)
import Row.Class (class SubRow)


foreign import eventListenerImpl :: forall props. ReactClass props
foreign import withOptionsImpl :: forall options event
                                . Fn2 (SyntheticEventHandler event)
                                      options
                                      (WithOptions event)


type HandlerOptions =
  ( capture :: Boolean -- ^ Default: `false`
  , passive :: Boolean -- ^ Default: `false`
  )

type WithOptions event =
  { handler :: SyntheticEventHandler event
  , options :: { | HandlerOptions }
  }


withOptions :: forall options event
             . SubRow options HandlerOptions
            => SyntheticEventHandler event
            -> { | options }
            -> WithOptions event
withOptions = runFn2 withOptionsImpl



-- class IsHandler handler

-- instance isHandlerSyntheticEventHandler :: IsHandler 

-- class IsHandler a
-- instance syntheticHandlerIsHandler :: IsHandler (SyntheticEventHandler SyntheticEvent)
-- instance withOptionsIsHandler :: IsHandler WithOptions


type EventListenerProps o =
  { target :: EventTarget
  | o }


type EventListenerPropsO =
  ( onAnimationStart :: SyntheticEventHandler SyntheticAnimationEvent
  , onAnimationEnd :: SyntheticEventHandler SyntheticAnimationEvent
  , onAnimationIteration :: SyntheticEventHandler SyntheticAnimationEvent
  , onTransitionEnd :: SyntheticEventHandler SyntheticTransitionEvent
  , onToggle :: SyntheticEventHandler SyntheticEvent
  , onError :: SyntheticEventHandler SyntheticEvent
  , onLoad :: SyntheticEventHandler SyntheticEvent
  , onAbort :: SyntheticEventHandler SyntheticEvent
  , onCanPlay :: SyntheticEventHandler SyntheticEvent
  , onCanPlayThrough :: SyntheticEventHandler SyntheticEvent
  , onDurationChange :: SyntheticEventHandler SyntheticEvent
  , onEmptied :: SyntheticEventHandler SyntheticEvent
  , onEncrypted :: SyntheticEventHandler SyntheticEvent
  , onEnded :: SyntheticEventHandler SyntheticEvent
  , onLoadedData :: SyntheticEventHandler SyntheticEvent
  , onLoadedMetadata :: SyntheticEventHandler SyntheticEvent
  , onLoadStart :: SyntheticEventHandler SyntheticEvent
  , onPause :: SyntheticEventHandler SyntheticEvent
  , onPlay :: SyntheticEventHandler SyntheticEvent
  , onPlaying :: SyntheticEventHandler SyntheticEvent
  , onProgress :: SyntheticEventHandler SyntheticEvent
  , onRateChange :: SyntheticEventHandler SyntheticEvent
  , onSeeked :: SyntheticEventHandler SyntheticEvent
  , onSeeking :: SyntheticEventHandler SyntheticEvent
  , onStalled :: SyntheticEventHandler SyntheticEvent
  , onSuspend :: SyntheticEventHandler SyntheticEvent
  , onTimeUpdate :: SyntheticEventHandler SyntheticEvent
  , onVolumeChange :: SyntheticEventHandler SyntheticEvent
  , onWaiting :: SyntheticEventHandler SyntheticEvent
  , onCopy :: SyntheticEventHandler SyntheticClipboardEvent
  , onCut :: SyntheticEventHandler SyntheticClipboardEvent
  , onPaste :: SyntheticEventHandler SyntheticClipboardEvent
  , onCompositionEnd :: SyntheticEventHandler SyntheticCompositionEvent
  , onCompositionStart :: SyntheticEventHandler SyntheticCompositionEvent
  , onCompositionUpdate :: SyntheticEventHandler SyntheticCompositionEvent
  , onKeyDown :: SyntheticEventHandler SyntheticKeyboardEvent
  , onKeyPress :: SyntheticEventHandler SyntheticKeyboardEvent
  , onKeyUp :: SyntheticEventHandler SyntheticKeyboardEvent
  , onFocus :: SyntheticEventHandler SyntheticFocusEvent
  , onBlur :: SyntheticEventHandler SyntheticFocusEvent
  , onChange :: SyntheticEventHandler SyntheticInputEvent
  , onInput :: SyntheticEventHandler SyntheticInputEvent
  , onInvalid :: SyntheticEventHandler SyntheticInputEvent
  , onSubmit :: SyntheticEventHandler SyntheticInputEvent
  , onClick :: SyntheticEventHandler SyntheticMouseEvent
  , onContextMenu :: SyntheticEventHandler SyntheticMouseEvent
  , onDoubleClick :: SyntheticEventHandler SyntheticMouseEvent
  , onDrag :: SyntheticEventHandler SyntheticMouseEvent
  , onDragEnd :: SyntheticEventHandler SyntheticMouseEvent
  , onDragEnter :: SyntheticEventHandler SyntheticMouseEvent
  , onDragExit :: SyntheticEventHandler SyntheticMouseEvent
  , onDragLeave :: SyntheticEventHandler SyntheticMouseEvent
  , onDragOver :: SyntheticEventHandler SyntheticMouseEvent
  , onDragStart :: SyntheticEventHandler SyntheticMouseEvent
  , onDrop :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseDown :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseEnter :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseLeave :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseMove :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseOut :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseOver :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseUp :: SyntheticEventHandler SyntheticMouseEvent
  , onSelect :: SyntheticEventHandler SyntheticEvent
  , onTouchCancel :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchEnd :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchMove :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchStart :: SyntheticEventHandler SyntheticTouchEvent
  , onScroll :: SyntheticEventHandler SyntheticUIEvent
  , onWheel :: SyntheticEventHandler SyntheticWheelEvent
  , onAnimationStartCapture :: SyntheticEventHandler SyntheticAnimationEvent
  , onAnimationEndCapture :: SyntheticEventHandler SyntheticAnimationEvent
  , onAnimationIterationCapture :: SyntheticEventHandler SyntheticAnimationEvent
  , onTransitionEndCapture :: SyntheticEventHandler SyntheticTransitionEvent
  , onToggleCapture :: SyntheticEventHandler SyntheticEvent
  , onErrorCapture :: SyntheticEventHandler SyntheticEvent
  , onLoadCapture :: SyntheticEventHandler SyntheticEvent
  , onAbortCapture :: SyntheticEventHandler SyntheticEvent
  , onCanPlayCapture :: SyntheticEventHandler SyntheticEvent
  , onCanPlayThroughCapture :: SyntheticEventHandler SyntheticEvent
  , onDurationChangeCapture :: SyntheticEventHandler SyntheticEvent
  , onEmptiedCapture :: SyntheticEventHandler SyntheticEvent
  , onEncryptedCapture :: SyntheticEventHandler SyntheticEvent
  , onEndedCapture :: SyntheticEventHandler SyntheticEvent
  , onLoadedDataCapture :: SyntheticEventHandler SyntheticEvent
  , onLoadedMetadataCapture :: SyntheticEventHandler SyntheticEvent
  , onLoadStartCapture :: SyntheticEventHandler SyntheticEvent
  , onPauseCapture :: SyntheticEventHandler SyntheticEvent
  , onPlayCapture :: SyntheticEventHandler SyntheticEvent
  , onPlayingCapture :: SyntheticEventHandler SyntheticEvent
  , onProgressCapture :: SyntheticEventHandler SyntheticEvent
  , onRateChangeCapture :: SyntheticEventHandler SyntheticEvent
  , onSeekedCapture :: SyntheticEventHandler SyntheticEvent
  , onSeekingCapture :: SyntheticEventHandler SyntheticEvent
  , onStalledCapture :: SyntheticEventHandler SyntheticEvent
  , onSuspendCapture :: SyntheticEventHandler SyntheticEvent
  , onTimeUpdateCapture :: SyntheticEventHandler SyntheticEvent
  , onVolumeChangeCapture :: SyntheticEventHandler SyntheticEvent
  , onWaitingCapture :: SyntheticEventHandler SyntheticEvent
  , onCopyCapture :: SyntheticEventHandler SyntheticClipboardEvent
  , onCutCapture :: SyntheticEventHandler SyntheticClipboardEvent
  , onPasteCapture :: SyntheticEventHandler SyntheticClipboardEvent
  , onCompositionEndCapture :: SyntheticEventHandler SyntheticCompositionEvent
  , onCompositionStartCapture :: SyntheticEventHandler SyntheticCompositionEvent
  , onCompositionUpdateCapture :: SyntheticEventHandler SyntheticCompositionEvent
  , onKeyDownCapture :: SyntheticEventHandler SyntheticKeyboardEvent
  , onKeyPressCapture :: SyntheticEventHandler SyntheticKeyboardEvent
  , onKeyUpCapture :: SyntheticEventHandler SyntheticKeyboardEvent
  , onFocusCapture :: SyntheticEventHandler SyntheticFocusEvent
  , onBlurCapture :: SyntheticEventHandler SyntheticFocusEvent
  , onChangeCapture :: SyntheticEventHandler SyntheticInputEvent
  , onInputCapture :: SyntheticEventHandler SyntheticInputEvent
  , onInvalidCapture :: SyntheticEventHandler SyntheticInputEvent
  , onSubmitCapture :: SyntheticEventHandler SyntheticInputEvent
  , onClickCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onContextMenuCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDoubleClickCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragEndCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragEnterCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragExitCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragLeaveCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragOverCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDragStartCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onDropCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseDownCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseEnterCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseLeaveCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseMoveCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseOutCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseOverCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onMouseUpCapture :: SyntheticEventHandler SyntheticMouseEvent
  , onSelectCapture :: SyntheticEventHandler SyntheticEvent
  , onTouchCancelCapture :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchEndCapture :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchMoveCapture :: SyntheticEventHandler SyntheticTouchEvent
  , onTouchStartCapture :: SyntheticEventHandler SyntheticTouchEvent
  , onScrollCapture :: SyntheticEventHandler SyntheticUIEvent
  , onWheelCapture :: SyntheticEventHandler SyntheticWheelEvent
  )


eventListener :: forall o
               . SubRow o EventListenerPropsO
              => EventListenerProps o -> Array ReactElement -> ReactElement
eventListener = unsafeCreateElement eventListenerImpl
