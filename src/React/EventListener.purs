module React.EventListener
  ( HandlerOptions, WithOptions, withOptions
  , class IsHandler, SyntheticEventHandler' (..), eventHandler
  , EventListenerProps, EventListenerPropsO, eventListener
  , EventListenerPropsOAnimation
  , EventListenerPropsOClipboard
  , EventListenerPropsOKeyboard
  , EventListenerPropsOComposition
  , EventListenerPropsOFocus
  , EventListenerPropsOInput
  , EventListenerPropsOMouse
  , EventListenerPropsOTouch
  , EventListenerPropsOWheel
  , EventListenerPropsOTransition
  , EventListenerPropsOInputCapture
  , EventListenerPropsOClipboardCapture
  , EventListenerPropsOKeyboardCapture
  , EventListenerPropsOMouseCapture
  , EventListenerPropsOTouchCapture
  , EventListenerPropsOAnimationCapture
  , EventListenerPropsOTransitionCapture
  , EventListenerPropsOCompositionCapture
  , EventListenerPropsOMisc
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
import Type.Row (type (+))


foreign import eventListenerImpl :: forall props. ReactClass props
foreign import withOptionsImpl :: forall options event
                                . Fn2 (SyntheticEventHandler event)
                                      options
                                      (WithOptions event)


type HandlerOptions =
  ( capture :: Boolean -- ^ Default: `false`
  , passive :: Boolean -- ^ Default: `false`
  )

newtype WithOptions event = WithOptions
  { handler :: SyntheticEventHandler event
  , options :: { | HandlerOptions }
  }


withOptions :: forall options event
             . SubRow options HandlerOptions
            => SyntheticEventHandler event
            -> { | options }
            -> WithOptions event
withOptions = runFn2 withOptionsImpl


-- | For type solving the IsHandler typeclass
newtype SyntheticEventHandler' event = SyntheticEventHandler' (SyntheticEventHandler event)

-- | Sugar for lifting a type synonym `React.SyntheticEventHandler` to newtype `SyntheticEventHandler'`
eventHandler :: forall event. SyntheticEventHandler event -> SyntheticEventHandler' event
eventHandler = SyntheticEventHandler'


class IsHandler (handler :: Type -> Type)
instance isHandlerSyntheticEventHandler' :: IsHandler SyntheticEventHandler'
instance isHandlerWithOptions :: IsHandler WithOptions



eventListener :: forall o
               . SubRow o EventListenerPropsO
              => EventListenerProps o -> Array ReactElement -> ReactElement
eventListener = unsafeCreateElement eventListenerImpl


-- * Types

type EventListenerPropsO =
    EventListenerPropsOAnimation
  + EventListenerPropsOClipboard
  + EventListenerPropsOKeyboard
  + EventListenerPropsOComposition
  + EventListenerPropsOFocus
  + EventListenerPropsOInput
  + EventListenerPropsOMouse
  + EventListenerPropsOTouch
  + EventListenerPropsOWheel
  + EventListenerPropsOTransition
  + EventListenerPropsOInputCapture
  + EventListenerPropsOClipboardCapture
  + EventListenerPropsOMouseCapture
  + EventListenerPropsOMouseCapture
  + EventListenerPropsOTouchCapture
  + EventListenerPropsOAnimationCapture
  + EventListenerPropsOTransitionCapture
  + EventListenerPropsOCompositionCapture
  + EventListenerPropsOMisc
  + ()



type EventListenerProps o =
  { target :: EventTarget
  | o }


type EventListenerPropsOAnimation r =
  ( onAnimationStart :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  , onAnimationEnd :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  , onAnimationIteration :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  | r)

type EventListenerPropsOClipboard r =
  ( onCopy :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  , onCut :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  , onPaste :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  | r)

type EventListenerPropsOKeyboard r =
  ( onKeyDown :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  , onKeyPress :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  , onKeyUp :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  | r)

type EventListenerPropsOComposition r =
  ( onCompositionEnd :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  , onCompositionStart :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  , onCompositionUpdate :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  | r)

type EventListenerPropsOFocus r =
  ( onFocus :: forall handler. IsHandler handler => handler SyntheticFocusEvent
  , onBlur :: forall handler. IsHandler handler => handler SyntheticFocusEvent
  | r)

type EventListenerPropsOInput r =
  ( onChange :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onInput :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onInvalid :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onSubmit :: forall handler. IsHandler handler => handler SyntheticInputEvent
  | r)

type EventListenerPropsOMouse r =
  ( onClick :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onContextMenu :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDoubleClick :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDrag :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragEnd :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragEnter :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragExit :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragLeave :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragOver :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragStart :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDrop :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseDown :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseEnter :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseLeave :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseMove :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseOut :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseOver :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseUp :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  | r)

type EventListenerPropsOTouch r =
  ( onTouchCancel :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchEnd :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchMove :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchStart :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  | r)

type EventListenerPropsOWheel r =
  ( onWheel :: forall handler. IsHandler handler => handler SyntheticWheelEvent
  | r)

type EventListenerPropsOTransition r =
  ( onTransitionEnd :: forall handler. IsHandler handler => handler SyntheticTransitionEvent
  | r)


type EventListenerPropsOInputCapture r =
  ( onChangeCapture :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onInputCapture :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onInvalidCapture :: forall handler. IsHandler handler => handler SyntheticInputEvent
  , onSubmitCapture :: forall handler. IsHandler handler => handler SyntheticInputEvent
  | r)

type EventListenerPropsOClipboardCapture r =
  ( onCopyCapture :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  , onCutCapture :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  , onPasteCapture :: forall handler. IsHandler handler => handler SyntheticClipboardEvent
  | r)

type EventListenerPropsOKeyboardCapture r =
  ( onKeyDownCapture :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  , onKeyPressCapture :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  , onKeyUpCapture :: forall handler. IsHandler handler => handler SyntheticKeyboardEvent
  | r)

type EventListenerPropsOMouseCapture r =
  ( onClickCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onContextMenuCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDoubleClickCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragEndCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragEnterCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragExitCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragLeaveCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragOverCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDragStartCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onDropCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseDownCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseEnterCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseLeaveCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseMoveCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseOutCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseOverCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  , onMouseUpCapture :: forall handler. IsHandler handler => handler SyntheticMouseEvent
  | r)

type EventListenerPropsOTouchCapture r =
  ( onTouchCancelCapture :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchEndCapture :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchMoveCapture :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  , onTouchStartCapture :: forall handler. IsHandler handler => handler SyntheticTouchEvent
  | r)

type EventListenerPropsOAnimationCapture r =
  ( onAnimationStartCapture :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  , onAnimationEndCapture :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  , onAnimationIterationCapture :: forall handler. IsHandler handler => handler SyntheticAnimationEvent
  | r)

type EventListenerPropsOTransitionCapture r =
  ( onTransitionEndCapture :: forall handler. IsHandler handler => handler SyntheticTransitionEvent
  | r)

type EventListenerPropsOCompositionCapture r =
  ( onCompositionEndCapture :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  , onCompositionStartCapture :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  , onCompositionUpdateCapture :: forall handler. IsHandler handler => handler SyntheticCompositionEvent
  | r)

-- | Ones I haven't organized yet due to the ol' lazyitis
type EventListenerPropsOMisc r =
  ( onToggle :: forall handler. IsHandler handler => handler SyntheticEvent
  , onError :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoad :: forall handler. IsHandler handler => handler SyntheticEvent
  , onAbort :: forall handler. IsHandler handler => handler SyntheticEvent
  , onCanPlay :: forall handler. IsHandler handler => handler SyntheticEvent
  , onCanPlayThrough :: forall handler. IsHandler handler => handler SyntheticEvent
  , onDurationChange :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEmptied :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEncrypted :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEnded :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadedData :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadedMetadata :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadStart :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPause :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPlay :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPlaying :: forall handler. IsHandler handler => handler SyntheticEvent
  , onProgress :: forall handler. IsHandler handler => handler SyntheticEvent
  , onRateChange :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSeeked :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSeeking :: forall handler. IsHandler handler => handler SyntheticEvent
  , onStalled :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSuspend :: forall handler. IsHandler handler => handler SyntheticEvent
  , onTimeUpdate :: forall handler. IsHandler handler => handler SyntheticEvent
  , onVolumeChange :: forall handler. IsHandler handler => handler SyntheticEvent
  , onWaiting :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSelect :: forall handler. IsHandler handler => handler SyntheticEvent
  , onScroll :: forall handler. IsHandler handler => handler SyntheticUIEvent
  , onToggleCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onErrorCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onAbortCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onCanPlayCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onCanPlayThroughCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onDurationChangeCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEmptiedCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEncryptedCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onEndedCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadedDataCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadedMetadataCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onLoadStartCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPauseCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPlayCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onPlayingCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onProgressCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onRateChangeCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSeekedCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSeekingCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onStalledCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onSuspendCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onTimeUpdateCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onVolumeChangeCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onWaitingCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onFocusCapture :: forall handler. IsHandler handler => handler SyntheticFocusEvent
  , onBlurCapture :: forall handler. IsHandler handler => handler SyntheticFocusEvent
  , onSelectCapture :: forall handler. IsHandler handler => handler SyntheticEvent
  , onScrollCapture :: forall handler. IsHandler handler => handler SyntheticUIEvent
  , onWheelCapture :: forall handler. IsHandler handler => handler SyntheticWheelEvent
  | r)
