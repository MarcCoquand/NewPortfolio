module View.Process exposing (process)

import Types.Types exposing (Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


process : Model -> Html Msg
process model =
    div [ class "flex flex-column pa5" ]
        [ div [ class "f3 i center garamond" ] [ text "It all begins with a need..." ]
        ]
