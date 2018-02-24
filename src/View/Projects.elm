module View.Projects exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types.Types exposing (..)


timelineButton : Model -> String -> Msg -> Html Msg
timelineButton model name msg =
    button [ class "w2 h2 pulse-button" ]
        [ text "" ]


timeline : Model -> Html Msg
timeline model =
    div [ class "w-100 center absolute " ]
        [ timelineButton model "" NoOp
        ]


projects : Model -> Html Msg
projects model =
    div [ class "mt6-ns mt4 center" ]
        [ div [ class "f3 center tc" ]
            [ text "My work" ]
        , timeline model
        ]
