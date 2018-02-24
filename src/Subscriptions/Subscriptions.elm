module Subscriptions.Subscriptions exposing (subscriptions)

import Types.Types as Types exposing (..)
import Ports.Onload as Onload exposing (..)
import Ports.Firebase as Firebase exposing (..)
import Time exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Onload.headerImg HeaderImgLoaded
        , Firebase.formResult SentFormResult
        , every (60 * millisecond) TickTypewriter
        ]
