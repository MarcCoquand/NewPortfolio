module Utils exposing (..)

import Types.Types exposing (..)
import Html exposing (..)
import Html.Events as Events
import Json.Decode as Json


onLoadSrc : (String -> Msg) -> Html.Attribute Msg
onLoadSrc tagger =
    Events.on "load" (Json.map tagger targetSrc)


targetSrc : Json.Decoder String
targetSrc =
    Json.at [ "target", "src" ] Json.string
