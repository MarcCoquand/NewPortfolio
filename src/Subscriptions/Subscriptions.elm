module Subscriptions.Subscriptions exposing (subscriptions)

import Types.Types as Types exposing (..)
import Ports.Onload as Onload exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Onload.headerImg HeaderImgLoaded
